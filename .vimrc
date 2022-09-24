filetype on
filetype plugin on
filetype indent on

syntax on
set background=dark
colorscheme solarized8

set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab

" Do not save backup files.
set nobackup

set nowrap
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Show partial command you type in the last line of the screen.
set showcmd

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

"allows local vimrc
set exrc
set secure

"fix lightline bug
set laststatus=2
set noshowmode

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
"Plug 'StanAngeloff/php.vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'neomake/neomake'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'vim-test/vim-test'
"Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
call plug#end()

set encoding=UTF-8
let mapleader = " " " map leader to Space
let g:snipMate = { 'snippet_version' : 1 }

" ctags
au BufWritePost *.php silent! !eval '[ -f ~/.git_hooks/ctags ] && ~/.git_hooks/ctags' 

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"   \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

let $FZF_DEFAULT_COMMAND = 'find .'
"phpactor config
augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
  au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
  au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
  au FileType php,cucumber nmap <buffer> <Leader>o
              \ :PhpactorGotoDefinition edit<CR>
  au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
  au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
  au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
  au FileType php nmap <buffer> <Leader>fr :PhpactorFindReferences<CR>
  au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
  au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
  au FileType php nmap <buffer> <silent> <Leader>ee
              \ :PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>ee
              \ :<C-u>PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>em
              \ :<C-u>PhpactorExtractMethod<CR>
augroup END
 
"coc config
" Select range based on AST
nmap <silent><Leader>r <Plug>(coc-range-select)
xmap <silent><Leader>r <Plug>(coc-range-select)

" Navigations
nmap <Leader>o <Plug>(coc-definition)
nmap <Leader>O <Plug>(coc-type-definition)
nmap <Leader>I <Plug>(coc-implementation)
nmap <Leader>R <Plug>(coc-references)

" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

" Use <CR> to validate completion (allows auto import on completion)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Hover
nmap K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Pas sûr d’utiliser ça
" Text objects for functions and classes (uses document symbol provider)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
autocmd CursorHold * silent call CocActionAsync('highlight')

"nerdtree config
nnoremap <leader>t :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"custom mapping
nnoremap <s-up> ddkP
nnoremap <s-down> ddp
nnoremap o o<esc>
nnoremap O O<esc>

"vim-test config
nmap <silent> <leader>v :TestVisit<CR>
nmap <silent> <leader>d :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>j :TestSuite<CR>
nmap <silent> <leader>z :TestNearest<CR>
let test#strategy = {
  \ 'nearest': 'make',
  \ 'last': 'make',
  \ 'suite': 'make',
  \ 'file': 'make',
\}
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END
let test#enabled_runners = ["php#phpunit"]

"fzf config
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>
nnoremap <leader>f :Files<CR>
nnoremap <leader><S-f> :Ag<CR>
autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"php-cs-fixer config
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"neomake config
call neomake#configure#automake('nrwi', 500)
"let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_open_list = 2
let g:neomake_php_phpstan_exe = './vendor/bin/phpstan'
let g:neomake_php_phpstan_args = ['analyse', '--configuration=phpstan.neon', '--error-format', 'raw', '--no-progress']
let g:php_cs_fixer_path = './vendor/bin/php-cs-fixer'
let g:php_cs_fixer_config_file = './.php-cs-fixer.dist.php'

"snippets config
fun! Filename(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")

  let basename = expand('%:t:r')

  if basename == ''
    return arg2
  else
    return substitute(template, '$1', basename, 'g')
  endif
endf

