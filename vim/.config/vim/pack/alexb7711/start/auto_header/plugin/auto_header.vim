if exists('g:auto_header_loaded')
	finish
endif

if !exists('g:auto_header_auto_enable')
	let g:auto_header_auto_enable = 0
endif

if !exists('g:auto_header_default_author')
	let g:auto_header_default_author = $USER
endif

if g:auto_header_auto_enable
	call auto_header#enable()
endif

command Autoheader        call auto_header#make_header()
command AutoheaderUpdate  call auto_header#update_modified_time()
command AutoheaderEnable  call auto_header#enable()
command AutoheaderDisable call auto_header#disable()

let g:auto_header_loaded = 1
