"关键字高亮显示
syntax enable
syntax on
"配色方案
colorscheme desert

"不兼容vi
set nocompatible

"插入模式可用<BS>删除光标前字符
set backspace=2

"显示行号
set number
"突出显示当前行
set cursorline
"打开状态栏标尺
set ruler
"总是显示状态栏
set laststatus=2
"状态栏信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
"文件改动自动载入
set autoread
"自动保存
set autowrite
"禁止临时文件生成
set nobackup
set noswapfile

"c语言自动缩进
set cindent
set autoindent
"新行智能自动缩进
set smartindent

"tab键自动替换为空格
set expandtab
"tab键输出空格数
set tabstop=2
"退格键一次删除空格数
set softtabstop=2
set shiftwidth=2

"粘贴复制
set mouse=v

"搜索时高亮显示匹配文本
set hlsearch
set incsearch
"替换操作时替换行内所有匹配项，而不是只替换第一个
set gdefault
"搜索时忽略大小写
set ignorecase
"高亮显示配对的括号
set showmatch
"关闭智能补全预览窗口
set completeopt=longest,menu

"鼠标定位
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1

"保存全局变量
set viminfo+=!
"带有如下符号的单词不做换行分割
set iskeyword+=_,$,@,%,#,-
set linespace=10
"自动切换到当前文件所在目录
set autochdir
set showcmd
set showmode
set linebreak
"取消命令错误提醒响铃
set t_vb=

"自动换行
"set wrap
"不自动换行
"set nowrap

set scrolloff=5

filetype on
filetype plugin on
filetype indent on

"全选 复制
map <C-A> ggVGY
map! <C-A> <ESC>ggVGY
"格式化代码
map <F12> gg=G

"vim之间粘贴复制
map <C-C> "+y
map <C-V> "+p
vmap <C-C> "+y

"模仿windows alt+s
map <C-S> :wa<CR>
imap <C-S> <ESC>:wa<CR>

"隐藏菜单和工具栏
set guioptions-=m
set guioptions-=T
map <silent> <F11> : if &guioptions=~# 'T'<BAR>
    \set guioptions-=T<BAR>
    \set guioptions-=m<BAR>
  \else <BAR>
    \set guioptions+=T<BAR>
    \set guioptions+=m<BAR>
  \endif<CR>

"同名头文件和源文件切换
map <F2> :A<cr>

"按下<F3>查找光标所在的字符串
nnoremap <silent> <F3> :Rgrep<CR>

" 按下F6，执行make clean
map <F6> :cd /home/public/github/links/out<CR><CR> :make clean<CR><CR><CR>
" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
map <F7> :cd /home/public/github/links/out<CR><CR> :make<CR><CR><CR> :copen<CR><CR>
" 按下F8，光标移到上一个错误所在的行
map <F8> :cp<CR>
" 按下F9，光标移到下一个错误所在的行
map <F9> :cn<CR>
" 以上的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC> :cd /home/public/github/links/out<CR><CR> :make clean<CR><CR><CR>
imap <F7> <ESC> :cd /home/public/github/links/out<CR><CR> :make<CR><CR><CR> :copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>

"taglist
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1               "只显示当前文件的tag
let Tlist_Use_Right_Window=1		          "在左侧窗口显示
let Tlist_File_Fold_Auto_Close=1
let Tlist_Process_File_Always=1 "实时更新tags
nmap <F5> :TlistToggle<cr>
map <F10> :!ctags -R -f /home/public/github/links/out/tags --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=/home/public/download/tags
set tags+=/home/public/github/links/out/tags

"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"NERDTree
map <F4> :NERDTreeToggle<CR>

"SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType='<C-X><C-O>'

" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1

"空格键自动匹配成对符号
func AutoClose()
  let word = getline('.')
  
  if word =~ '\s*\(if\|elseif\|while\|switch\)$'
    return "(){\<NL>}\<UP>\<END>\<LEFT>\<LEFT>"
  endif

  if word =~ '\s*for$'
    return "(;;){\<NL>}\<UP>\<END>\<LEFT>\<LEFT>\<LEFT>\<LEFT>"
  endif

  if word =~ '\s*function$'
  	return "(){\<NL>}\<UP>\<END>\<LEFT>\<LEFT>\<LEFT>"
  endif

  if word =~ '\s*try$'
	  return "{\<NL>\<NL>}catch(e){}\<UP>\<TAB>"
  endif

  return "\<SPACE>"
endfunc

autocmd BufReadPost *.{c,cpp,h,js,java} inoremap <expr> <SPACE> AutoClose()

imap () ()<LEFT>
imap [] []<LEFT>
imap {} {}<LEFT>
imap "" ""<LEFT>
imap '' ''<LEFT>

"自动注释
autocmd BufNewFile *.{c,cpp,h,js,java} call SetCopyright(0)
autocmd BufNewFile *.h call SetCopyright(1)
let prefix = "LINKS_"
let user = "QianYe(coordcn@163.com)"

func SetCopyright(type)
  call setline(1, "/**************************************************************")
  call setline(2, "  @copyright: Copyright(c) 2015 coord.cn All rights reserved")
  call setline(3, "  @author: ".g:user)
  call setline(4, "  @license: MIT license")
" call setline(4, "  @created: ".strftime("%c"))
" call setline(5, "  @modified: ".strftime("%c"))
  call setline(5, "  @overview: ")
  call setline(6, " **************************************************************/")
  call setline(7, "")

  if a:type == 1
    call setline(8, "#ifndef ".g:prefix.toupper(expand("%:t:r"))."_H")
    call setline(9, "#define ".g:prefix.toupper(expand("%:t:r"))."_H")
    call setline(10, "")
    call setline(11, "")
    call setline(12, "")
    call setline(13, "#endif /*".g:prefix.toupper(expand("%:t:r"))."_H*/")
  else
    call setline(8, "")
  endif
endfunc

"autocmd BufWrite *.c,*.h,*.cpp,*.js call SetModified()

"func SetModified()
"  call setline(5, "  @modified: ".strftime("%c"))
"endfunc
