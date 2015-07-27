" 引入按键映射
" source ~/.vim/.vimrc.map
" =============================================================================
" 基础设置
" =============================================================================
set foldcolumn=12
" leader
let mapleader = ';'
" 256色
set t_Co=256

" syntax
syntax on
syntax enable

" history : how many lines of history VIM has to remember
set history=2000

" filetype
filetype on

" Enable filetype plugins
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.tpl setf html
" 主题
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme desert
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
"colorscheme railscasts
"colorscheme blackdust
"colorscheme blackdust
"colorscheme asmanian_blood
"colorscheme wombat256mod
"colorscheme hybrid
"set background=dark

" 80列提示线
if exists('+colorcolumn')
    set colorcolumn=90
else
    " Emulate
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%90v.\+', -1)
endif

" 将 pathogen 自身也置于独立目录中，需指定其路径 
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()
" =============================================================================
" set设置
" =============================================================================
set pastetoggle=<F12>
set winaltkeys=no
set noautochdir
set nocompatible                " 关闭兼容模式
set autoread                    " 自动加载
set shortmess=atI               " 不显示乌干达
set magic                       " 正则
set titlestring=%t              " 标题
set nobackup                    " 不保留备份文件
set nowritebackup
set noswapfile

set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash
set t_vb=
set tm=500

" 设置环境保存项
"set sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize"
" 保存 undo 历史
if has('persistent_undo')
    set undofile
    set undolevels=200
    set undodir=~/.vim/tmp/undo
endif
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"
" " 恢复快捷键
map <leader>sr :source my.vim<cr> :rviminfo my.viminfo<cr>
" ::MBEToggle<cr>
"
" execute project related configuration in current directory
"if filereadable("workspace.vim")
     "source workspace.vim
"endif
"if filereadable("my.vim")
"     source my.vim
"endif
"if filereadable("my.viminfo")
"     rviminfo my.viminfo
"endif
" 设置path路径
set path=.,,

" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldlevel=99
" 启动 vim 时关闭折叠代码
set nofoldenable

"set cursorcolumn                " 光标高亮
set cursorline
set scrolloff=10                 " keep 10 lines when scrolling

set wrap
"set columns=84
set linebreak
set showbreak=+++
set whichwrap+=<,>,h
set listchars=tab:..,trail:.
set list
" show
set ruler                       " show the current row and column
set number                      " show line numbers
set numberwidth=10              " 数字区宽度
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis

" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" tab
set expandtab                   " expand tabs to spaces
set smarttab                    " 自动识别tab长度
set shiftround

" indent
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4                    " 设置Tab键的宽度(等同的空格个数))
set softtabstop=4                " 按退格键时可以一次删掉4个空格

" NOT SUPPORT
" fold
" set foldenable
" set foldmethod=indent

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" select & complete
set selection=inclusive
set selectmode=key

set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" status line
set statusline=%<%F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar

" others
set backspace=indent,eol,start  " make that backspace key work the way it should
set pastetoggle=<F5>
au InsertLeave * set nopaste

" =============================================================================
" 按键映射
" =============================================================================
nmap <Leader><Leader>j <C-W>j
nmap <Leader><Leader>k <C-W>k
nmap <Leader><Leader>l <C-W>l
nmap <Leader><Leader>h <C-W>h
nmap <Leader><Leader>c <C-W>c
nmap <Leader><Leader>r :set foldcolumn=1<CR>
nmap <Leader><Leader>e :set foldcolumn=12<CR>

"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
" 设置重新载入.vimrc快捷键
map <silent> <leader>es :source ~/.vimrc<cr>
"设置快速编辑.vimrc快捷键
map <silent> <leader>ee :e! ~/.vimrc<cr>
map <silent> <leader>ep :e! ~/.vim/.vimrc.plugin<cr>
map <leader>ec :e ~/.vim/colors
map <leader>eb :e ~/.vim/bundle
map <F9> :set paste<CR>
map <F10> :set nopaste<CR>

" 普通模式
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap gi ^
nnoremap ga $
nnoremap H 10k
nnoremap L 10j
nnoremap go o<Esc>
nnoremap gO O<Esc>
"nnoremap <silent> gm :cal cursor(line("."), virtcol('$')/2<CR>
nnoremap gk viw
nnoremap <Leader>r :e!<CR>
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 取消搜索的高亮
noremap <silent><leader>/ :nohls<CR>
" 列出书签
noremap <silent><leader>m :marks<CR>
nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 插入模式
inoremap jj <Esc>

func AutoPair(open, close)
  let line = getline('.')
  if col('.') > strlen(line) || index([' ', ']', ')', '}'], line[col('.') - 1]) > 0
    return a:open . a:close . "\<ESC>i"
  else
    return a:open
  endif
endf
func ClosePair(char)
  return (getline('.')[col('.') - 1] == a:char ? "\<Right>" : a:char)
endf
inoremap <expr> ( AutoPair('(', ')')
inoremap <expr> ) ClosePair(')')
inoremap <expr> [ AutoPair('[', ']')
inoremap <expr> ] ClosePair(']')
inoremap <expr> { AutoPair('{', '}')
inoremap <expr> } ClosePair('}')
inoremap ' ''<LEFT>

" 可视模式
vnoremap < <gv
vnoremap > >gv
vnoremap gi ^
vnoremap ga $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y

" 命令模式
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cmap w!! w !sudo tee >/dev/null %


map <Leader>n :MBEToggle<cr>
inoremap <C-j> <Esc>:bp!<cr>i
inoremap <C-k> <Esc>:bn!<cr>i
inoremap <C-h> <Esc>:b#<cr>i
nnoremap <C-j> :bp!<cr>
nnoremap <C-k> :bn!<cr>
nnoremap <C-h> :b#<cr>
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>e :Explore<CR>

" 引入插件配置
source ~/.vim/.vimrc.plugin
