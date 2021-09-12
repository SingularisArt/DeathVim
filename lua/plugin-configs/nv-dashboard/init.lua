local home = os.getenv('HOME')

vim.g.dashboard_footer_icon = '🐬 '
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
	find_history = {
		description = {'  Recently opened files'},
		command =  'DashboardFindHistory'},
	search_history = {
		description = {'  Recently searched'},
		command =  'Telescope search_history'},
	find_file  = {
		description = {'  Find file'},
		command = 'Telescope find_files'},
	new_file = {
	 description = {'  File browser'},
	 command =  'Telescope file_browser'},
	find_word = {
	 description = {'  Find word'},
	 command = 'DashboardFindWord'},
	git_status = {
	 description = {' Git status'},
	 command = 'Telescope git_status'},
	vim_options = {
	 description = {' Vim options'},
	 command = 'Telescope vim_options'},
	help_tags = {
	 description = {' Help tags'},
	 command = 'Telescope help_tags'},
	man_pages = {
	 description = {' Man pages'},
	 command = 'Telescope vim_options'},
	key_maps = {
	 description = {' Key maps'},
	 command = 'Telescope key_maps'},
	jump_list = {
	 description = {' Jump list'},
	 command = 'Telescope jump_list'},
	commands = {
	 description = {' Vim commands'},
	 command = 'Telescope commands'},
	buffers = {
	 description = {' Vim buffers'},
	 command = 'Telescope buffers'},
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
