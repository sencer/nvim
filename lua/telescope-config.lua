local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    initial_mode = 'normal',
    mappings = {
      n = {
        ["<Leader>q"] = actions.close,
      },
    },
  }
}

local mappings = {
  ['<Leader>f'] = 'find_files()',
  ['<Leader>F'] = 'file_browser()',
  ['<Leader>b'] = 'buffers()',
  ['<Leader>j'] = 'oldfiles()',
  ['<Leader>h'] = 'command_history()',
  ['<Leader>g'] = 'grep_string()',
  ['<Leader>G'] = 'live_grep()',
}

for map, fn in pairs(mappings) do
  vim.api.nvim_set_keymap(
    "n", map, '<cmd>lua require("telescope.builtin").'..fn..'<CR>',
    {noremap=true, silent=true})
end


