-- Overwrite default mapping for the benefit of my muscle memory. ('o'
-- would normally open in a split window, but we want it to open in the
-- current one.)
SingularisArt.vim.nnoremap('o', ":<C-U>.call dirvish#open('edit', 0)<CR>", { buffer = true, nowait = true, silent = true })

-- Seeing as SingularisArt.colorcolumn_filetype_blacklist doesn't work for this:
SingularisArt.vim.setlocal('colorcolumn', '')
