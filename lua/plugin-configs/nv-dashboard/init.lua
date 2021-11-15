local home = os.getenv('HOME')

vim.g.dashboard_footer_icon = '🐬 '
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
	find_file  = {
		description = {'  Find file'},
		command = 'Telescope find_files'},
	buffers = {
		description = {' Vim buffers'},
		command = 'Telescope buffers'},
	help_tags = {
		description = {' Help tags'},
		command = 'Telescope help_tags'},
	man_pages = {
		description = {' Man pages'},
		command = 'Telescope vim_options'},
	key_maps = {
		description = {' Key maps'},
		command = 'Telescope key_maps'},
	git_status = {
		description = {' Git status'},
		command = 'Telescope git_status'},
}

vim.g.dashboard_custom_header = {
       "            :h-                                  Nhy`               ",
       "           -mh.                           h.    `Ndho               ",
       "           hmh+                          oNm.   oNdhh               ",
       "          `Nmhd`                        /NNmd  /NNhhd               ",
       "          -NNhhy                      `hMNmmm`+NNdhhh               ",
       "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
       "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
       "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
       "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
       " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
       " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
       " hd+` -NNNy`./dNNNNNhhhh+-://///   -+ooo:`  ::-:+////++///:`        ",
       " /Nmhs+oss-:++/dNNNmhho:--::///   /mmmmmmo  ../-///++///////.       ",
       "  oNNdhhhhhhhs//osso/:---:::///   /myyyyso  ..o+-//////////:/.      ",
       "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
       "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
       "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
       "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
       "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
       "       //+++//++++++////+++///::--                 .::::-------::   ",
       "       :/++++///////////++++//////.                -:/:----::../-   ",
       "       -/++++//++///+//////////////               .::::---:::-.+`   ",
       "       `////////////////////////////:.            --::-----...-/    ",
       "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
       "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/mm`   ",
       "           ::::://::://::::::::::::::----------..-:....`.../Nmhd+o/ ",
       "            -/:::-:::::---://:-::-::::----::---.-.......`-/oNN   `` ",
       "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
       "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
       "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
       "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
       "                        .-:mNdhh:.......--::::-`                    ",
       "                           yNh/..------..`                          ",
       "                                                                    ",
       "                             N E O V I M                             ",
}
