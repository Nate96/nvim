local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.keymap.set('n', '<leader>fgit', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function() 
   local input_string = vim.fn.input("Search For > ")
    if (input_string == '') then
      return
    end
    require("telescope.builtin").grep_string({
      search = input_string,
    })	
end)
