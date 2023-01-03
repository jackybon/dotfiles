" ---------- [ General Setting ] -----------
set encoding=UTF-8 nobackup nowritebackup nocursorline splitright splitbelow wildmode=longest,list,full
set shiftwidth=2 tabstop=2 softtabstop=-1 expandtab
set autoindent smartindent
set fileencodings=ucs-bom,utf-8,default,latin1,gb18030
set scrolloff=8

set nocompatible
filetype on
filetype plugin on
filetype indent on

" colors
"set t_Co=256
"set termguicolors
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" ---------- [ Status Line ] -----------
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

let b:gitbranch=""
function! StatuslineGitBranch()
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
				let b:gitbranch=substitute(l:gitrevparse, '\n', '', 'g')
      endif
    catch
    endtry
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=%#NonText#
set statusline+=%=
set statusline+=%f\ 
set statusline+=%#CursorLineNr#
set statusline+=\ %Y
set statusline+=\ %r
set statusline+=%#IncSearch#
set statusline+=\ %l/%L
set statusline+=\ [%c]

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" ---------- [ Key Binding ] -----------
let g:mapleader = ","
map <Leader>l :NERDTreeToggle<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>S :edit ~/.vimrc<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
map Q <nop>
nnoremap n nzzzv
nnoremap N Nzzzv
"noremap <C-n> :cnext<CR>
"noremap <C-m> :cprevious<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>vx :split<CR>

nnoremap <leader>y :call ToogleClipboard()<CR>
function ToogleClipboard()
	let x = &clipboard
	if empty(x)
		set clipboard=unnamed
		echo "Clipboard ON"
	else
		set clipboard=
		echo "Clipboard OFF"
	endif
endfunction

" ---------- [ Plugins ] -----------
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox' "theme
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'  "0712 align multiple lines with specific charset

"web
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'AndrewRadev/tagalong.vim'

"rust
"Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

"Plug 'ryanoasis/vim-devicons'
"Plug 'LunarWatcher/auto-pairs'
"Plug 'Chiel92/vim-autoformat'
"Plug 'junegunn/goyo.vim'  "0712
"Plug 'junegunn/limelight.vim' "0712

call plug#end()

" ---------- [ Plugin Setting ] -----------
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/vim-go.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc.vim
"source ~/.config/nvim/markdown-preview.vim
"source ~/.config/nvim/goyo.vim

"colorscheme
colorscheme gruvbox

"nertree git plugin
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

"easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" react
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" autoformat
noremap <C-u> :Autoformat<CR>

" tagalong
let g:tagalong_verbose = 1

" limelight
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

" nvim-treesitter
" lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}  " At the bottom of your init.vim, keep all configs on one line
" require'nvim-treesitter.configs'.setup {
"   context_commentstring = {
"     enable = true
"   }
" }

" ---------- [ Features ] -----------
" Since NVIM v0.4.0-464-g5eaa45547, commit 5eaa45547975c652e594d0d6dbe34c1316873dc7
" 'secure' is set when 'modeline' is set, which will cause a lot of commands
" cannot run in autocmd when opening help page.
augroup secure_modeline_conflict_workaround
	autocmd!
	autocmd FileType help setlocal nomodeline
augroup END

