lua << EOF
local high_str = require("high-str")


high_str.setup({
	verbosity = 0,
	highlight_colors = {
		-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
		color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
		color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
		color_3 = {"#8A2BE2", "smart"},	-- Proton purple
		color_4 = {"#FF4500", "smart"},	-- Orange red
		color_5 = {"#008000", "smart"},	-- Office green
		color_6 = {"#0000FF", "smart"},	-- Just blue
	}
})
EOF

vnoremap <silent> <f2> :<c-u>HSHighlight 1<CR>
vnoremap <silent> <f4> :<c-u>HSHighlight 2<CR>
vnoremap <silent> <f5> :<c-u>HSHighlight 3<CR>
vnoremap <silent> <f6> :<c-u>HSHighlight 4<CR>
vnoremap <silent> <f7> :<c-u>HSHighlight 5<CR>
vnoremap <silent> <f8> :<c-u>HSHighlight 6<CR>
vnoremap <silent> <f9> :<c-u>HSRmHighlight<CR>
