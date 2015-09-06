"==================common config=============
"定义快捷键的前缀，即<leader>
let mapleader=";"

"开启文件类型侦测
filetype on

"根据侦测到的不同类型加载对应的插件
filetype plugin on

" 关闭兼容模式
set nocompatible

"vim自身命令行模式智能补全
set wildmenu

" 禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"总是显示状态栏
set laststatus=2

"显示光标当前位置
set ruler

"开启行号显示
set number
"高亮显示当前行/列
set cursorline
set cursorcolumn
"高亮显示搜索结果
set hlsearch

"设置gvim显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

"禁止折行
"set nowrap

"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"自适应不同语言的智能缩进
filetype indent on
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4

set history=50
set autoread
set showmatch
set showmode
set wildchar=<TAB>
set wildmenu
set wildignore=*.o,*.class,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set autoindent
set nobackup
set nowb
set noswapfile
set copyindent
set smartcase
set smarttab
set noerrorbells
set novisualbell
set lbr
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=2

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"定义快捷键保存并退出当前窗口内容
nmap <Leader>x :x<CR>
"定义快捷键保存所有窗口内容并退出vim
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存，强制退出vim
nmap <Leader>Q :qa!<CR>


"开启实时搜索功能
set incsearch
"搜索时大小写不敏感
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


""""""""""
"代码折叠: za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
""""""""""
"基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim时关闭折叠代码
set nofoldenable




"""""""""""
"powerline: https://github.com/Lokaltog/vim-powerline
"""""""""""
"设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'




"""""""""""
" pathogen: https://github.com/tpope/vim-pathogen
"""""""""""
"将pathogen自身也置于独立目录中，需要指定路径
"
runtime bundle/pathogen/autoload/pathogen.vim
"运行pathogen
execute pathogen#infect()


"""""""""
"配色方案
"solarized: https://github.com/altercation/vim-colors-solarized
"molokai: https://github.com/tomasr/molokai
"phd: http://www.vim.org/scripts/script.php?script_id=3139
""""""""""
set background=dark
"colorscheme molokai
"colorscheme solarized
colorscheme phd 


""""""""""
" c++ stl语法: https://github.com/Mizuchi/STL-Syntax
""""""""""

""""""""""
"Indent Guides: https://github.com/nathanaelkane/vim-indent-guides
""""""""""
"随vim自启动
let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块宽度
let g:indent_guides_guide_size=1
"快捷键i开/关缩进可视化
:nmap <silent><Leader>i <Plug>IndentGuidesToggle


"""""""""""
" cpp 和 h 之间切换
" a.vim: https://github.com/vim-scripts/a.vim
"""""""""""
nmap <Leader>ch :A<CR>
"子窗口中显示*.cpp或*.h
nmap <Leader>sch :AS<CR>


"""""""""""""
"代码收藏
"vim-signature: https://github.com/kshenoy/vim-signature
"""""""""""""
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }




"""""""""""""
"Exuberant Ctags: http://ctags.sourceforge.net/
"""""""""""""
"./config && make && sudo make install
"ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

"""""""""""""
"自动生成tag文件，并告诉vim使用这个文件，周期性的更新
"indexer: http://www.vim.org/scripts/script.php?script_id=3221
"DfrankUtil: http://www.vim.org/scripts/script.php?script_id=3884
"vimprj: http://www.vim.org/scripts/script.php?script_id=3872
""""""""""""""

"设置插件indexer调用ctags的参数
"默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
"默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
let g:indexer_disableCtagsWarning=1



"""""""""""""
"tagbar: https://github.com/majutsushi/tagbar
"""""""""""""
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list
nnoremap <Leader>tl :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }



"""""""""""""
"全局查找
"ctrlsf: 
"""""""""""""
" 使用 ctrlsf.vim插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>



"""""""""""""
"内容替换
"""""""""""""
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" 不确认、非整词
nnoremap <Leader>rnn :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rnw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rcn :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>





""""""""""""""
"快速开关注释
"NERD Commenter: https://github.com/scrooloose/nerdcommenter
""""""""""""""
"<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //
"如果选中一行的部分内容 则在选中部分前后添加分别 /、/；
"<leader>cu，取消选中文本块的注释。


""""""""""""""
"模板补全
"UltiSnips: https://github.com/SirVer/ultisnips
"无效!!!!!
""""""""""""""
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"



"""""""""""""
"智能补全
"YCM: https://github.com/Valloric/YouCompleteMe
"LLVM: http://llvm.org/releases/download.html
"""""""""""""


nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>



""""""""""""""
"python-mode
""""""""""""""
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

"python文件自动添加# -*- coding: utf-8 -*-
autocmd bufnewfile *.py call setline(1, "# -*- coding: utf-8 -*-")
