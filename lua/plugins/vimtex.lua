return {
  'lervag/vimtex',
  lazy = false,
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_leader = ' '
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }
    -- vim.g.vimtex_compiler_latexmk = {
    --     executable = 'latexmk',
    --     options = {
    --         '-pdf',
    --         '-lualatex',
    --         '-shell-escape',
    --         '-verbose',
    --         '-file-line-error',
    --         '-synctex=1',
    --         '-interaction=nonstopmode',
    --     },
    -- }

    -- Use latexmk as the default compiler
    vim.g.vimtex_compiler_progname = 'nvr'  -- For Neovim Remote (nvr) integration
  end,
}
