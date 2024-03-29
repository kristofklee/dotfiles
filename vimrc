set nocompatible     
filetype off
let mapleader=","
let maplocalleader=","

call pathogen#runtime_append_all_bundles()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mechatroner/rainbow_csv'
"Plugin 'tpope/vim-fugitive'

" Snippet engine
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set bs=2
set wrapmargin=8
set ruler
"if has('gui_running')
	"set background=light
"else
	"set background=dark
"endif
set background=dark
"colorscheme manuscript
"colorscheme vividchalk
"colorscheme molokai
"let g:molokai_original=0
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme tomorrow-night
syntax on
set nobackup
set nu
set ve=block,insert
set go-=T
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set switchbuf=usetab
set guioptions=aAce
set incsearch

set directory=~/.vim/tmp/

if has("mouse")
	set mouse=a
endif

" help tags
set tags=/Users/n00bian/Dropbox/vimwiki/tags,./tags,tags
autocmd BufWritePost /Users/n00bian/Dropbox/vimwiki/* :helptags /Users/n00bian/Dropbox/vimwiki
au BufNewFile,BufRead /Users/n00bian/Dropbox/vimwiki/* set filetype=vimwiki
autocmd FileType vimwiki set spell
autocmd FileType vimwiki syn match TextTag "\*[a-zA-Z]*\*"
autocmd FileType vimwiki syn match TextJump "|[a-zA-Z]*|"
hi def link TextTag String
hi def link TextJump Comment

" vimwiki
let wiki = {}
let wiki.syntax = 'markdown'
let wiki.path = '~/Dropbox/vimwiki/'
let wiki.path_html = '~/Dropbox/Public/vimwiki/'
let wiki.diary_rel_path = ''
let wiki.diary_index = 'Diary'
let wiki.diary_header = 'Blog'
let wiki.diary_link_count = 1
let wiki.ext = '.txt'
let wiki.html_header = '~/Dropbox/vimwiki/header.tpl'
let wiki.html_footer = '~/Dropbox/vimwiki/footer.tpl'
let wiki.css_name = 'style.css'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java', 'vim': 'vim', 'bash': 'sh', 'ruby': 'ruby', 'diff': 'diff'}
let g:vimwiki_list = [wiki]
let g:vimwiki_use_mouse=1
let g:vimwiki_folding=0

command! Wiki :VimwikiTabGoHome



function StofflVimwikiToRedmine()
	%s/===== \(.*\) =====/h5. \1\r/e
	%s/==== \(.*\) ====/h4. \1\r/e
	%s/=== \(.*\) ===/h3. \1\r/e
	%s/== \(.*\) ==/h2. \1\r/e
	%s/= \(.*\) =/h1. \1\r/e

	%s/^\t\*/\*/e
	%s/^\t\t\*/\*\*/e

	%s/%toc/{{>toc}}/e

	%s/{{{class="brush:\s*\(.*\)\s*"/<pre><code class="\1">/e
	%s/{{{$/<pre><code>/e
	%s/{{{\(.*\)/<pre><code class="\1">/e
	%s/}}}/<\/code><\/pre>/e

	%s/^\n\+/\r/e  
endfunction
command VimwikiToRedmine :call StofflVimwikiToRedmine()

function StofflMarkdownToRedmine()
	%s/^#####\(.*\)/h5.\1\r/e
	%s/^####\(.*\)/h4.\1\r/e
	%s/^###\(.*\)/h3.\1\r/e
	%s/^##\(.*\)/h2.\1\r/e
	%s/^#\(.*\)/h1.\1\r/e

	%s/^---$//e
	%s/^-/\*/e
	%s/^\t-/\*\*/e
	%s/^\t\t-/\*\*\*/e
	%s/^\t\*/\*/e
	%s/^\t\t\*/\*\*/e

	%s/__/\*/g

	%s/%toc/{{>toc}}/e

	%s/{{{class="brush:\s*\(.*\)\s*"/<pre><code class="\1">/e
	%s/{{{$/<pre><code>/e
	%s/{{{\(.*\)/<pre><code class="\1">/e
	%s/}}}/<\/code><\/pre>/e

	%s/^\n\+/\r/e
endfunction
command MarkdownToRedmine :call StofflMarkdownToRedmine()


" handle URI
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" netrw
let g:netrw_silent = 1
let g:netrw_keepdir = 0
let g:netrw_special_syntax = 1
let g:netrw_list_hide = "\.pyc$,\.swp$,\.bak$"
"let g:netrw_retmap = 1
"nmap <Leader>e :Explore<CR>

" calendar
let g:calendar_monday = 1

" UTL
let g:utl_cfg_hdl_scm_http_system = "silent !open '%u'"
let g:utl_cfg_hdl_scm_http = "silent !open '%u'"
nmap <unique> <Leader>ge :Utl openLink underCursor edit<CR>
nmap <unique> <Leader>gu :Utl openLink underCursor edit<CR>
nmap <unique> <Leader>gE :Utl openLink underCursor split<CR>
nmap <unique> <Leader>gS :Utl openLink underCursor vsplit<CR>
nmap <unique> <Leader>gt :Utl openLink underCursor tabedit<CR>
nmap <unique> <Leader>gv :Utl openLink underCursor view<CR>
nmap <unique> <Leader>gr :Utl openLink underCursor read<CR>
vmap <unique> <Leader>ge "*y:Utl openLink visual edit<CR>
vmap <unique> <Leader>gu "*y:Utl openLink visual edit<CR>
vmap <unique> <Leader>gE "*y:Utl openLink visual split<CR>
vmap <unique> <Leader>gS "*y:Utl openLink visual vsplit<CR>
vmap <unique> <Leader>gt "*y:Utl openLink visual tabedit<CR>
vmap <unique> <Leader>gv "*y:Utl openLink visual view<CR>
vmap <unique> <Leader>gr "*y:Utl openLink visual read<CR>
nmap <unique> <Leader>cfn :Utl copyFileName underCursor native<CR>
nmap <unique> <Leader>cfs :Utl copyFileName underCursor slash<CR>
nmap <unique> <Leader>cfb :Utl copyFileName underCursor backSlash<CR>
vmap <unique> <Leader>cfn "*y:Utl copyFileName visual native<CR>
vmap <unique> <Leader>cfs "*y:Utl copyFileName visual slash<CR>
vmap <unique> <Leader>cfb "*y:Utl copyFileName visual backSlash<CR>
nmap <unique> <Leader>cl :Utl copyLink underCursor<CR>
vmap <unique> <Leader>cl "*y:Utl copyLink visual<CR>

" NERDTree
nmap <Leader>nt :NERDTree<CR>

let g:tex_flavor='latex'


" VIMCASTS
if has("autocmd")
	" Restore cursor position
	autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
endif

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]


" ctrlp

nmap <Leader>t :CtrlP<CR>

" minitest

set completefunc=syntaxcomplete#Complete

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors


command Tidy  :%!tidy -q -i -xml
command TidyHtml  :%!tidy -q -i -html

" marked app integration
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" utilsnips should use tabs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
