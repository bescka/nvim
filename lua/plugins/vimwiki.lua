return {
  'vimwiki/vimwiki',
  enabled = false,
  init = function()
    vim.g.vimwiki_list = {
      {
        name = 'bwiki',
        path = '~/ctrl/besca_wiki',
        path_html = '~/docs/besca_wiki_html',
        syntax = 'default',
        ext = '.wiki',
      },
      {
        name = 'fc',
        path = '~/flounders_and_codes',
        path_html = '~/summer2024/users/bescka',
        syntax = 'default',
        ext = '.wiki',
        template_path = '~/flounders_and_codes/site_templates',
        template_default = 'custom_default',
        template_ext = '.html',
      },
    }
  end,
  config = function()
    vim.g.vimwiki_autowriteall = 1
    vim.g.vimwiki_auto_export = 1
    vim.g.vimwiki_auto_toc = 1
    vim.g.vimwiki_list_margin = -1
  end,
}
