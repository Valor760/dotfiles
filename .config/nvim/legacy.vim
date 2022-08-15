" Make command
au FileType zig nnoremap <silent> ;m :make<CR>
au FileType zig nnoremap <silent> ;r :make run<CR>

" C++ helpers

" switch between hpp and cpp
au BufEnter,BufNew *.cpp nnoremap <silent> ;p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;p :e %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;vp :leftabove vs %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;vp :rightbelow vs %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;xp :leftabove split %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;xp :rightbelow split %<.cpp<CR>

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" easy-motion
" disable default mappings, turn on case-insensitivity
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" move to start of line when jumping lines
let g:EasyMotion_startofline = 1

" faster updates!
set updatetime=100

" no hidden buffers
set hidden&

" automatically read on change
set autoread

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" ;t is trim
nnoremap ;t <silent> :Trim<CR>

" easy search
nnoremap ;s :s/

" easy search/replace with current visual selection
xnoremap ;s y:%s/<C-r>"//g<Left><Left>

" easy search/replace on current line with visual selection
xnoremap ;ls y:.s/<C-r>"//g<Left><Left>

" ;w is save
noremap <silent> ;w :update<CR>

" language-specific formatters
au FileType cpp set formatprg=clang-format | set equalprg=clang-format

" no folds, ever
set foldlevelstart=99

set nocompatible
let c_no_curly_error=1

" Python
let g:python3_host_prog="/usr/local/bin/python3"

" Get syntax files from config folder
set runtimepath+=~/.config/nvim/syntax

" fzf in runtimepath
set rtp+=/usr/local/opt/fzf

" Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598

" Set c-z to undo
nnoremap <c-z> <u>

" Ctrl-k closes all floating windows in normal mode
nmap <c-k> call coc#float#close_all()

" Remap C-c to global copy buffer
nmap <c-c> "+y
imap <c-c> "+y
vmap <c-c> "+y
omap <c-c> "+y

" Map insert mode CTRL-{hjkl} to arrows
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" same in normal mode
nmap <C-h> <Left>
nmap <C-j> <Down>
nmap <C-k> <Up>
nmap <C-l> <Right>

" Syntax highlighting
syntax on

" Position in code
set number
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8

" Line wrap
set wrap

" C-p: FZF find files
nnoremap <silent> <C-p> :Files<CR>

" C-g: FZF ('g'rep)/find in files
nnoremap <silent> <C-g> :Rg<CR>

" Function to set tab width to n spaces
function! SetTab(n)
	let &tabstop=a:n
	let &shiftwidth=a:n
	let &softtabstop=a:n
	set expandtab
	set autoindent
	set smartindent
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

set noexpandtab
set autoindent
set smartindent
set tabstop=4 shiftwidth=4
set scrolloff=8
set tw=0 wm=0


" Function to trim extra whitespace in whole file
function! Trim()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

set t_Co=256

" Binary files -> xxd
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" ASM == JDH8
augroup jdh8_ft
	au!
	autocmd BufNewFile,BufRead *.asm    set filetype=jdh8
augroup END

" SQL++ == SQL
augroup sqlpp_ft
	au!
	autocmd BufNewFile,BufRead *.sqlp   set syntax=sql
augroup END

" .S == gas
augroup gas_ft
	au!
	autocmd BufNewFile,BufRead *.S      set syntax=gas
augroup END

" .vs = glsl
augroup vs_ft
	au!
	autocmd BufNewFile,BufRead *.vs     set syntax=glsl
augroup END

" .fs = glsl
augroup fs_ft
	au!
	autocmd BufNewFile,BufRead *.fs     set syntax=glsl
augroup END

" .sc = glsl
augroup sc_ft
	au!
	autocmd BufNewFile,BufRead *.sc     set filetype=glsl
augroup END

" .frag = glsl
augroup frag_ft
	au!
	autocmd BufNewFile,BufRead *.frag     set filetype=glsl
augroup END

" .vert = glsl
augroup vert_ft
	au!
	autocmd BufNewFile,BufRead *.vert     set filetype=glsl
augroup END

" JFlex syntax highlighting
augroup jfft
	au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim

" Mouse support
set mouse=a

" Map F8 to Tagbar
nmap <F8> :TagbarToggle<CR>

" disable backup files
set nobackup
set nowritebackup

set shortmess+=c

set signcolumn=yes

" show syntax group of symbol under cursor
function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" My stuff
set relativenumber
set cursorline
set list
set listchars=tab:⁞\ ,eol:¬
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl,*.rgen,*.comp,*.rchit,*.rahit,*.rmiss set ft=glsl
set ic
let g:airline_highlighting_cache=1
set ttyfast
set lazyredraw
let g:netrw_liststyle=3
