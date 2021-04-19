local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local util = require'lspconfig/util'

local on_attach = function(client, bufnr)

  if os.getenv('CITC_ROOT') then
    if client.name == 'clangd' then
      vim.lsp.stop_client(client.id)
    end
  else
    if client.name == 'cider' then
      vim.lsp.stop_client(client.id)
    end
  end

  mappings = {
    n = {
    ['<Leader><C-]>'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
       ['<Leader>rn'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
        ['<Leader>d'] = '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>',
        ['<Leader>a'] = '<CMD>lua vim.lsp.buf.code_action()<CR>',
       ['<Leader>wa'] = '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
       ['<Leader>wr'] = '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
       ['<Leader>wl'] = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            ['<C-]>'] = '<Cmd>lua vim.lsp.buf.definition()<CR>',
               ['g]'] = '<Cmd>lua vim.lsp.buf.declaration()<CR>',
               ['g['] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
               ['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
                ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
        ['<Leader>D'] = '<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist=false})<CR>',
             ['<F9>'] = '<cmd>Vista nvim_lsp<CR>',
    },
    i = {
            ['<C-k>'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>'
    }
  }

  if client.resolved_capabilities.document_formatting then
    mappings['n']['<Leader>='] = "<cmd>lua vim.lsp.buf.formatting()<CR>"
  elseif client.resolved_capabilities.document_range_formatting then
    mappings['n']['<Leader>='] = "<cmd>lua vim.lsp.buf.range_formatting()<CR>"
  end

  for mode, maps in pairs(mappings) do
    for map, fn in pairs(maps) do
      vim.api.nvim_buf_set_keymap(bufnr, mode, map, fn, {noremap=true, silent=true})
    end
  end
end

if not lspconfig.cider then
  configs.cider = {
    default_config = {
      cmd = {
        "ssh",
        "sselcuk24.nyc.corp.google.com",
        "/google/bin/releases/editor-devtools/ciderlsp",
      },
      filetypes = {"cpp", "python", "bzl", "proto"},
      root_dir = function(fname)
        return vim.api.nvim_eval("$CITC_ROOT")
      end,
    },
  }
end

local servers = {"cider", "pyright", "pyls", "vimls", "bashls", "clangd"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach=on_attach }
end
