local nightfox = require('nightfox')

nightfox.setup({
  fox = 'duskfox',
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  },
  colors = {
    bg_alt = '#FF0000',
  },
  inverse = {
    match_paren = true,
    visual = false,
    search = false
  },
})

nightfox.load()
vim.cmd('color duskfox')

