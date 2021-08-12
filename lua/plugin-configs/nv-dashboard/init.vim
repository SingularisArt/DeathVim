let g:dashboard_default_executive = 'Telescope'

let g:dashboard_custom_section={
  \ 'find_file': {
		\ 'description': [' Find file                 SPC f f'],
		\ 'command': 'Telescope file_browser' },
	\ 'change_colorscheme': {
		\ 'description': [' Change colorscheme        SPC c c'],
		\ 'command': 'Telescope colorscheme' },
	\ 'buffer_list': {
		\ 'description': ['ﭯ Find buffer               SPC f b'],
		\ 'command': 'Telescope buffers' },
	\ }

