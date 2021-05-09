"" ----- CALL PLUGINS (VIM-PLUG) -----
call plug#begin()
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'dkarter/bullets.vim'
Plug 'francoiscabrol/ranger.vim'
call plug#end()


"" ----- PLUGIN SETTINGS -----
" Automatically toggle Limelight in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight background settings
hi Normal ctermbg=NONE guibg=NONE
let g:limelight_conceal_ctermfg = 244

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
set conceallevel=0

" Snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-l>'
let g:UltiSnipsJumpBackwardTrigger='<C-h>'
let g:UltiSnipsSnippetDirectories=["snips"]

" Ranger integration
let g:ranger_map_keys = 0


"" ----- STATUS LINE -----
highlight clear StatusLine
set laststatus=0
set noruler


"" ----- KEYBINDS -----
" Set the leader key to ','
let mapleader =","

" Shift + arrow keys resize splits
nnoremap <S-Up> :resize +2<CR>
nnoremap <S-Down> :resize -2<CR>
nnoremap <S-Left> :vertical resize +2<CR>
nnoremap <S-Right> :vertical resize -2<CR>

" Ctrl + t - new tab
map <silent> <C-t> :tabnew<CR>

" Ctrl + n - next tab
map <silent> <C-n> :tabnext<CR>

" Ctrl + w - close tab
map <silent> <C-w> :tabclose<CR>

" Ctrl + Backspace - delete last word
inoremap <C-H> <C-W>

" F2 - toggle line numbers
map <silent> <F2> :set nonumber! norelativenumber!<CR>

" F5 - clear whitespace
nnoremap <silent> <F5> :%s/\s\+$//<CR>

" F8 - enable spellchecking (use 'z=' for correction suggestions)
map <F8> :setlocal spell! spelllang=en_us<CR>

" Leader + t - show table of contents in markdown
map <silent> <leader>t :Toc<CR>

" Leader + b - show buffers with fzf
map <silent> <leader>b :Buffers<CR>

" Leader + f - fuzzy finder
map <leader>f :Files<CR>

" Leader + r - ranger
map <leader>r :Ranger<CR>

" Leader + g - toggle Goyo
map <silent> <leader>g :Goyo \| set linebreak<CR>

" Leader + z - open the current file's pdf version using zathura
map <leader>z :w! \| !zathura %:r.pdf &<CR>

" Leader + d - convert to docx using pandoc
map <leader>d :!pandoc % -s -o %:r.docx --reference-doc=$HOME/.local/pandoc/custom-reference.docx<CR>

" Leader + c - compile to pdf using pandoc with the xelatex engine
map <leader>c :w! \| !pandoc % -s -o %:r.pdf --pdf-engine=xelatex -V 'mainfont:Times New Roman' -V 'geometry:margin=2cm'<CR>


"" ----- QUALITY OF LIFE ------

" Cursor stays relatively in the middle while scrolling
set scrolloff=8

" Show tabs and whitespaces
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" Enable undo history file
set undofile

" Recognize filetypes
filetype plugin indent on

" Tab spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable line numbers
set relativenumber
set number

" Turn on syntax highlighting
syntax on

" Disable auto commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable case sensitivity
set ignorecase
set smartcase

" Enable autocompletion
set wildmode=longest,list,full

" Enable wrapping and linebreak
set wrap
set linebreak

" Use system clipboard (dependency: xclip)
" set clipboard+=unnamedplus

" Enable cursor line
" set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#303000 ctermbg=234

" Enable cursor column
" set cursorcolumn
" highlight CursorColumn guibg=#303000 ctermbg=234

" Enable the deletion of whitespace on save
" autocmd BufWritePre * %s/\s\+$//e


"" ----- DISABLE ARROW KEYS IN NORMAL MODE-----
noremap <up> :echoerr "USE K INSTEAD."<CR>
noremap <down> :echoerr "USE J INSTEAD."<CR>
noremap <left> :echoerr "USE H INSTEAD."<CR>
noremap <right> :echoerr "USE L INSTEAD."<CR>


"" ----- AUTORUN ON FILESAVE -----
" Run xrdb when Xdefaults or Xresources are updated
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc !pkill -USR1 -x sxhkd
