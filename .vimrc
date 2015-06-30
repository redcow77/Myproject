"map <F2> <C-w><C-w>
map <F2> :set nu!<cr>
map <F3> :Tlist<cr>
map <F4> :30vs<Space>./<cr>
map <F5> :diffthis<CR><C-w><C-w>:diffthis<CR>
map <F6> :diffoff<CR><C-w><C-w>:diffoff<CR>
nmap <F9> :SrcExplToggle <CR>
let g:SrcExpl_winHeight = 15
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<F5>"
let g:SrcExpl_gobackKey = "<F6>"
let g:SrcExpl_isUpdateTags = 0 

"" Ctrl+s는 소스파일과 헤더파일 전환 "
map <C-a> :A<CR>

map ,1 :b!1<CR>                         " 1번 파일 버퍼로 이동
map ,2 :b!2<CR>                         " 2번 파일 버퍼로 이동
map ,3 :b!3<CR>                         " 3번 파일 버퍼로 이동
map ,4 :b!4<CR>                         " 4번 파일 버퍼로 이동
map ,5 :b!5<CR>                         " 5번 파일 버퍼로 이동
map ,6 :b!6<CR>                         " 6번 파일 버퍼로 이동
map ,7 :b!7<CR>                         " 7번 파일 버퍼로 이동
map ,8 :b!8<CR>                         " 8번 파일 버퍼로 이동
map ,9 :b!9<CR>                         " 9번 파일 버퍼로 이동
map ,0 :b!10<CR>                        " 10번 파일 버퍼로 이동
map ,w :bw<CR>                          " 현재 파일 버퍼를 닫음

"########## Window ##########
set number      " 줄번호 표시
set ruler       " 커서 위치를 표시함 
set showcmd     " 마지막 라인에 커맨드 표시 
"
""########## Syntax ##########
if &t_Co > 2 || has("gui_runing")
        syntax on
        set hlsearch
endif

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col-1]!~'\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-P>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <expr> <CR> pumvisible() ? "<C-Y><CR>" : "<CR>"

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함.
" "set nocp
" " 똑똑한 대소문자 구별 기능 사용
 set scs
" " 똑똑한 들여쓰기 사용 안함
" "set si
 set ru          "커서 위치 항상 보이기 
"
 set sc          "완성중인 명령을 표시
"
 set nowrap      "자동 줄바꿈 사용 안함
"
 set sol         "이동 동작시 줄의 시작으로 자동 이동
"
 set sel=exclusive       "비쥬얼 모드 동작 설정
"
 set hls         "검색어 강조
"
 sy enable       "파일 형식에 따른 syntax 하이라이팅 on
"
" "아래는 한글을 제대로 처리하기 위해 필요하다.

set showmatch   "괄호를 입력할 때 일치하는 괄호 보여줌

set cindent     "C프로그래밍 들여쓰기 기능 사용

set autoindent  "자동 들여쓰기 on

set smartindent "좀 더 스마트한 들여쓰기 기능 on

set title       "타이틀 바에 현재 편집중인 파일명 표시

set paste! "붙여넣기시 계단현상 제거

filetype off "파일의 종류를 자동으로 인식
filetype plugin on "파일의 종류를 자동으로 인식

"set complets "자동완성"
"
""====== Tlist =====
"- 태그 범위(함수, 매크로, 구조체 등)를 표시
let Tlist_Display_Tag_Scope = 1
""- 함수 원형을 표시
let Tlist_Display_Prototype = 1
"- 태그 리스트 소팅 (소스 코드 위치 순서가 아닌 이름 순서로 표시)
let Tlist_Sort_Type = "name"
""- 태그 리스트 창을 우측에 표시
"let Tlist_Use_Right_Window = 1
""- 태그 리스트 창의 폭을 35문자로 지정
let Tlist_WinWidth = 35

func! Css()
        let css = expand("<cword>")
        "new
        "        exe "cs find s ".css
        "                if getline(1) == ""
        exe "q!"
        endif
        endfunc
        nmap ,css :call Css()<cr>

func! Csc()
        let csc = expand("<cword>")
        "new    
        "        exe "cs find c ".csc
        "                if getline(1) == ""
        exe "q!"
        endif
        endfunc
        nmap ,csc :call Csc()<cr>

func! Csd()
        let csd = expand("<cword>")
        "new
        "        exe "cs find d ".csd
        "                if getline(1) == ""
        exe "q!"
        endif
        endfunc
        nmap ,csd :call Csd()<cr>

func! Csg()
        let csg = expand("<cword>")
        "new
        "        exe "cs find g ".csg
        "                if getline(1) == ""
        exe "q!"
        endif
        endfunc
        nmap ,csg :call Csg()<cr>
