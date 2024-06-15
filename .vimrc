" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"" Custom Vim Configuration
"
" Add numbers to each line on the left-hand side.
set number

" Ignore capital letters during search
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Colorscheme
colorscheme dogrun

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Automatically compiles any code within them dmenu directory
autocmd BufWritePost */home/harrison/suckless/dmenu/* !cd /home/harrison/suckless/dmenu/; sudo make clean install

" Automatically compiles any code within the dwm directory
autocmd BufWritePost */home/harrison/suckless/dwm/* !cd /home/harrison/suckless/dwm/; sudo make clean install

" Automatically compiles any code within the slstatus directory
autocmd BufWritePost */home/harrison/suckless/slstatus/** !cd /home/harrison/suckless/slstatus/; sudo make clean install

" Automatically compiles any code within the st directory
autocmd BufWritePost */home/harrison/suckless/st/* !cd /home/harrison/suckless/st/; sudo make clean install


" }}}


" STATUS LINE ------------------------------------------------------------ {{{
func! VimMode() abort
    let md = mode()
    if md == 'n'
        return 'NORMAL'
    elseif md == 'v'
        return 'VISUAL'
    elseif md == 'i'
	return 'INSERT'
    elseif md == 'R'
	return 'REPLACE'
    else " check mode() help to define other mode names here
        return 'OTHER'
    endif
    
endfunc



" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline=\\|\ %{VimMode()}\ \\|
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ %y\ \\|
set statusline+=\ vim\ %p%%\ \\|
set statusline+=\ \%l:%c\ \\|

" Show the status on the second to last line.
set laststatus=2

" }}}
