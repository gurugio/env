"/usr/share/vim/vim71/vimrc_example.vim 파일 복사한것

" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
"set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")




"============== 기본 환경 설정 =============

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set number

set laststatus=2 " Always status line display including file name
" status line 설정 : 파일명/수정플래그/커서아래의문자의ASCII코드/column/line/TotalLine
set stl=%<%f\ %h%m%r%=0x%B\ %-10.(%c\ %l\/%L%)
" title 에 full path 표시
set titlestring=%F\ %m\ %r\ %*

" color
color evening

set bg=dark

" 알티베이스 소스 파일 포맷
set encoding=utf-8
set fileencoding=euc-kr
set fileencodings=euc-kr,utf-8
set cinoptions+=(0,W4
set fo+=t

" highlight doxygen comment
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1




set ruler  " 화면 오른쪽 아래에 현재 커서의 위치(줄,칸)을 보여줌
set showmatch
set ai     " 자동 들여쓰기
set showmode
"set wrap  " 자동으로 <CR> 삽입
set nobackup
"set textwidth=79  " 한 줄이 79글자가 넘어가면 줄넘김


" GREP options 는 쉘 환경변수 GREP_OPTIONS 로 세팅
let Grep_Path = '/bin/grep'
let Grep_OpenQuickfixWindow = 1
let Grep_Default_Options = '-rn'


" Q acts as q
abbr Q q
" W acts as w
abbr W w
abbr Wq wq


" set file-encoding to utf-8
nmap ,utf <esc>:set fileencoding=utf-8


"========== cscope를 사용하기 전에 미리 설정 사항 =============
set csto=0
set cst
set nocsverb




"============ cscope를 위한 키 맵핑 ========================

"-----------------------------------------

"CTRL+\+[search types]
"search types
"s: C 심볼 검색
"g: 정의 검색
"d: 커서가 있는 함수 안에서 호출되는 함수들 검색
"c: 커서가 있는 함수를 호출하는 함수
"t: 텍스트 문자열 검색
"e: 확장 정규식을 사용하여 검색
"f: 파일 이름 검색
"i: 이 파일을 인클루드하는 파일 검색


" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>



" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	
"
"    gvim does not input ctrl+spacebar
"if has("gui_running")
 "   nmap <C-c>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
 "   nmap <C-c>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
 "   nmap <C-c>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
 "   nmap <C-c>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
"else
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
"endif



" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left
"if has("gui_running")
"    nmap <C-c><C-c>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-c><C-c>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-c><C-c>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-c><C-c>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-c><C-c>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-c><C-c>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-c><C-c>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-c><C-c>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"else
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"endif

"============ ctags 설정 ========================
" ctags 태그 위치
" 커널과 다른 디렉토리에서 작업할 때도 태그 검색 가능
set tags=./tags,../tags,../../tags,../../../tags,tags

" stdc 라이브러리 헤더 파일 위치
" C-p 를 누르면 자동으로 함수 이름 완성됨
set path=.,/usr/include/,/usr/local/include,./include


"============ taglist plugin 설정 ================
"Tlist 설정
let Tlist_WinWidth = 20 " 태그 창 너비
let Tlist_Process_File_Always = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Display_Tag_Scope = 0
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 0 " 창 열려도 커서 안옮김
let Tlist_Use_Right_Window = 1 "오른쪽에 창 열기
let Tlist_Display_Prototype = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0



"============== winmanager plugin 설정 ==================
" 아래 3줄은 winmanager 홈피에서 권장한 설정
let g:winManagerWidth=30 " How wide should it be( pixels)
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " What windows should it
let g:persistentBehaviour = 0
" TAB 새창으로 열기
" c PWD를 현재 디렉토리로 변경
" C PWD로 이동
" R rename, D delete



"=========================== 키 맵핑 ========================
"======= 기본적으로 대부분의 맵핑은 ,로 시작하게 한다
"======= 창 이동과 관련된 맵핑은 C-w 로 시작한다.
"============================================================

"------------------------------
" imap: insert mode mapping
" nmap: noremal mode mapping
"------------------------------

" previous/next error in compile message window
nnoremap <silent> <F2> :cp<cr>
nnoremap <silent> <F3> :cn<cr>
nnoremap <silent> <C-F2> :tp<cr>            " Go to the previous tag
nnoremap <silent> <C-F3> :tn<cr>            " Go to the next tag


" copy one line and comment
nmap <F12> <esc>yy P I/* <esc>A */<esc>j
nmap ,cp <esc>yy P I/* <esc>A */<esc>j
nmap ,cc <esc>I/* <esc>A */<esc>j


" scroll down, 모든 모드에서 사용가능하도록 만듬
inoremap <C-E> <C-E>
nnoremap <C-E> <C-E>


"if has("gui_running")
    " save
"    inoremap <C-s> <esc>:w<cr>
"    nnoremap <C-s> :w<cr>
"endif


"call grep
nnoremap ,gr :Rgrep



" 폴딩 접기/펴기
nmap ,zf v]}zf
nmap ,zo zo

" IDE 개발 환경 시작
nmap ,id :WMToggle<cr>


"창 높이 조절
map <c-j> <c-w>+
map <c-k> <c-w>-


"창 너비 조절
map <c-h> <c-w>>
map <c-l> <c-w><


"go first explorer window
map <c-w><c-f> :FirstExplorerWindow<cr>
"go bottom explorer window
map <c-w><c-b> :BottomExplorerWindow<cr>


" ,st 는 가로 창을 나누고 선택된 태그를 연다.
func! Sts()
        let st = expand("<cword>")
        exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

" 세로 창 열고 태그 열기
func! Vts()
        let vt = expand("<cword>")
        exe "vs"
        exe "ts ".vt
endfunc
nmap ,vt :call Vts()<cr>



" cscope 데이터베이스 파일 읽기
" 현재 디렉토리에 cscope.out 파일이 있어야 cscope가 실행됨
"if filereadable("./cscope.out")
"        cs add cscope.out
"else
"    if filereadable("/home/gurugio/work/product/trunk/core/cscope.out")
"        cs add /home/gurugio/work/product/trunk/core/cscope.out
"    endif
"endif
" stdc 헤더 추가
"if filereadable("/usr/include/cscope.out")
"        cs add /usr/include/cscope.out
"endif



"set csverb


" ,css 명령은 :cs find s <symbol> 과 같은 역할을 함 (심볼 찾기)
func! Css()
        let css = expand("<cword>")
        new
        exe "cs find s ".css
        if getline(1) == ""
                exe "q!"
        endif
endfunc
nmap ,css :call Css()<cr>


" 라이브러리의 man 페이지 열기
func! Man()
        let sm = expand("<cword>")
        exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>


" make 실행한 후 결과 메시지를 새 창에 열어서 보여주기
nmap ,mk :w<cr> :make<cr>



"func! InsertTabWrapper()
"        let col = col('.') - 1
"        if !col || getline('.')col-1!~'\k'
"                return "\<TAB>"
"        else
"                if pumvisible()
"                        return "\<C-P>"
"                else
"                        return "\<C-N>\<C-P>"
"                end
"        endif
"endfunction

"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <expr> <CR> pumvisible() ? "<C-Y><CR>" : "<CR>"

"============== for Altibase ====================
" 알티베이스에서 사용하는 변수 타입은 .vim/syntax/c.vim 에 컬러가 정의됨

"파일 타입 추가
autocmd FileType Makefile                  setlocal noexpandtab
autocmd BufNewFile,BufRead *.i             setf c
autocmd BufNewFile,BufRead *.sc            setf c
autocmd BufNewFile,BufRead *.th,*.tc,*.ts  setf ruby
autocmd BufNewFile,BufRead *.re            setf lex
autocmd BufNewFile,BufRead *.ly            setf yacc
