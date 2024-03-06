-- TODO: Implement Functions to travers through journals

-- Navigating Enviorment
vim.keymap.set('n', '<leader>nf', ':Neorg journal tomorrow')
vim.keymap.set('n', '<leader>nd', ':Neorg journal today')
vim.keymap.set('n', '<leader>ns', ':Neorg journal yesterday')

-- go to index
vim.keymap.set('n', '<leader>ni', ':Neorg index')


-- Function to get a list of Norg files in the specified directory
local function get_norg_files(directory)
    local files = {}
    local pfile = io.popen('ls ' .. directory)
    for filename in pfile:lines() do
        if filename:match('^%d%d%d%d%-%d%d%-%d%d%.org$') then
            table.insert(files, filename)
        end
    end
    pfile:close()
    return files
end

-- Function to find the index of the current file in the list of files
local function find_current_index(files, current_file)
    for i, filename in ipairs(files) do
        if filename == current_file then
            return i
        end
    end
    return nil
end

-- Function to get the previous file name
local function get_previous_file(files, current_index)
    if current_index > 1 then
        return files[current_index - 1]
    else
        return files[#files]  -- Wrap around to the last file
    end
end

-- Function to get the next file name
local function get_next_file(files, current_index)
    if current_index < #files then
        return files[current_index + 1]
    else
        return files[1]  -- Wrap around to the first file
    end
end

-- Main function to jump backward or forward through Norg files
local function jump_through_files(directory, current_file, direction)
    local files = get_norg_files(directory)
    table.sort(files)  -- Sort files by date

    local current_index = find_current_index(files, current_file)
    if not current_index then
        print("Current file not found in directory.")
        return
    end

    local new_file
    if direction == "backward" then
        new_file = get_previous_file(files, current_index)
    elseif direction == "forward" then
        new_file = get_next_file(files, current_index)
    else
        print("Invalid direction. Please specify 'backward' or 'forward'.")
        return
    end

    print("Jumping", direction, "to:", new_file)
    -- Implement your logic to open/display the new_file
end

-- Example usage:
local current_file = "2024-03-05.org"  -- Current file
local directory = "/path/to/your/norg/files/directory/"
local direction = "backward"  -- or "forward"
jump_through_files(directory, current_file, direction)
