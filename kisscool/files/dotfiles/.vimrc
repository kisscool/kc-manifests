set nocompatible

" pathogen
call pathogen#infect()
call pathogen#helptags()

" minimal settings
filetype plugin indent on
set nobackup			" do not keep a backup file, use versions instead
syntax on			" use syntax highlighting
set mouse=			" do not use the mouse integration
set background=dark		" for dark screens
set number			" display numbers
set hlsearch			" highlight the last used search pattern
set incsearch			" do incremental searching
set history=1000		" keep n lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands

" tabs
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2


