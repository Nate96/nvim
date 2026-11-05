-- CodeDiff: keep both panes in sync when jumping (gd, gr, <C-o>, :e) inside a
-- diff tab opened with the explorer (`:CodeDiff`).
--   * Jumped-to file has changes -> show its full diff (and move explorer cursor).
--   * Jumped-to file has no changes -> file on the right, blank pane on the left.
--   * Jumping back (<C-o>) -> the previous file's diff is restored.
local ok, lifecycle = pcall(require, "codediff.ui.lifecycle")

if not ok then
   return
end

local group = vim.api.nvim_create_augroup("user_codediff_follow", { clear = true })

local function find_tabpage(win)
   local tabpage = vim.api.nvim_win_get_tabpage(win)
   local session = lifecycle.get_session(tabpage)

   if not session or not session.panel or session.panel.name ~= "explorer" then
      return nil
   end

   if win ~= session.original_win and win ~= session.modified_win then
      return nil
   end

   return tabpage, session
end

-- Changed file in the explorer matching `rel`; prefers unstaged over staged.
local function find_explorer_file(explorer, rel)
   local tree = require("codediff.ui.explorer.tree")
   local match

   for _, file in ipairs(tree.get_all_files(explorer.tree)) do
      if file.data.path == rel then
         if file.data.group ~= "staged" then
            return file
         end

         match = match or file
      end

   end

   return match
end

local function move_explorer_cursor(explorer, file)
   local line = file.node and file.node._line

   if line and explorer.winid and vim.api.nvim_win_is_valid(explorer.winid) then
      pcall(vim.api.nvim_win_set_cursor, explorer.winid, { line, 0 })
   end

end

-- Codediff renders asynchronously; put the cursor back where the jump landed.
local function restore_cursor(tabpage, session, bufnr, pos, after)
   local tries = 0

   local function attempt()
      tries = tries + 1

      if lifecycle.get_session(tabpage) ~= session then
         return
      end

      local busy = session.refresh and (session.refresh.loading or session.refresh.applying)
      if busy and tries < 40 then
         return vim.defer_fn(attempt, 25)
      end

      if after then
         after()
      end

      local win = session.modified_win
      if win and vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == bufnr then
         pcall(vim.api.nvim_win_set_cursor, win, pos)
         vim.api.nvim_set_current_win(win)
      end

   end
   vim.defer_fn(attempt, 25)
end

local function show_unchanged(tabpage, session, abs, bufnr, pos)
   local path = require("codediff.core.path")

   require("codediff.ui.view").update(tabpage, {
      git_root = session.git_root,
      original = path.empty(),
      modified = path.make_ref(abs, session.git_root),
   }, false)
   -- Nothing changed, so drop the "all lines added" highlights.
   --
   restore_cursor(tabpage, session, bufnr, pos, function()
      local _, mod_buf = lifecycle.get_buffers(tabpage)

      if mod_buf and vim.api.nvim_buf_is_valid(mod_buf) then
         lifecycle.clear_highlights(mod_buf)
      end
   end)
end

local function on_enter(event)
   local win = vim.api.nvim_get_current_win()

   if vim.api.nvim_win_get_buf(win) ~= event.buf or vim.bo[event.buf].buftype ~= "" then
      return
   end

   local tabpage, session = find_tabpage(win)
   if not tabpage or (session.refresh and session.refresh.applying) then
      return
   end

   local abs = vim.api.nvim_buf_get_name(event.buf)
   if abs == "" or not session.git_root then
      return
   end

   abs = vim.fn.fnamemodify(abs, ":p")
   -- Already the file on the right: codediff's own buffer swap, nothing to do.
   if win == session.modified_win and session.modified and session.modified.absolute == abs then
      return
   end

   local root = session.git_root:gsub("/$", "") .. "/"
   if abs:sub(1, #root) ~= root then
      return
   end

   local rel = abs:sub(#root + 1)

   vim.schedule(function()
      if lifecycle.get_session(tabpage) ~= session then
         return
      end

      -- Read the cursor only now: <C-o>, gd and :e +N set it after BufWinEnter.
      local pos = { 1, 0 }
      if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == event.buf then
         pos = vim.api.nvim_win_get_cursor(win)
      end

      local explorer = lifecycle.get_panel_view(tabpage)
      local file = explorer and find_explorer_file(explorer, rel)
      if file then
         move_explorer_cursor(explorer, file)
         explorer.on_file_select(file.data, { force = true, no_jump = true })
         restore_cursor(tabpage, session, event.buf, pos)
      else
         show_unchanged(tabpage, session, abs, event.buf, pos)
      end
   end)
end

vim.api.nvim_create_autocmd("BufWinEnter", { group = group, callback = on_enter })

vim.keymap.set("n", "<leader>cd", ":CodeDiff<CR>")
vim.keymap.set("n", "<leader>cm", ":CodeDiff main...<CR>")
