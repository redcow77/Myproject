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

"" Ctrl+s�� �ҽ����ϰ� ������� ��ȯ "
map <C-a> :A<CR>

map ,1 :b!1<CR>                         " 1�� ���� ���۷� �̵�
map ,2 :b!2<CR>                         " 2�� ���� ���۷� �̵�
map ,3 :b!3<CR>                         " 3�� ���� ���۷� �̵�
map ,4 :b!4<CR>                         " 4�� ���� ���۷� �̵�
map ,5 :b!5<CR>                         " 5�� ���� ���۷� �̵�
map ,6 :b!6<CR>                         " 6�� ���� ���۷� �̵�
map ,7 :b!7<CR>                         " 7�� ���� ���۷� �̵�
map ,8 :b!8<CR>                         " 8�� ���� ���۷� �̵�
map ,9 :b!9<CR>                         " 9�� ���� ���۷� �̵�
map ,0 :b!10<CR>                        " 10�� ���� ���۷� �̵�
map ,w :bw<CR>                          " ���� ���� ���۸� ����

"########## Window ##########
set number      " �ٹ�ȣ ǥ��
set ruler       " Ŀ�� ��ġ�� ǥ���� 
set showcmd     " ������ ���ο� Ŀ�ǵ� ǥ�� 
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


" �������� Vi ���� ȣȯ���� ���ְ�, Vim ���� ��ɵ��� �� �� �ְ� ��.
" "set nocp
" " �ȶ��� ��ҹ��� ���� ��� ���
 set scs
" " �ȶ��� �鿩���� ��� ����
" "set si
 set ru          "Ŀ�� ��ġ �׻� ���̱� 
"
 set sc          "�ϼ����� ����� ǥ��
"
 set nowrap      "�ڵ� �ٹٲ� ��� ����
"
 set sol         "�̵� ���۽� ���� �������� �ڵ� �̵�
"
 set sel=exclusive       "����� ��� ���� ����
"
 set hls         "�˻��� ����
"
 sy enable       "���� ���Ŀ� ���� syntax ���̶����� on
"
" "�Ʒ��� �ѱ��� ����� ó���ϱ� ���� �ʿ��ϴ�.

set showmatch   "��ȣ�� �Է��� �� ��ġ�ϴ� ��ȣ ������

set cindent     "C���α׷��� �鿩���� ��� ���

set autoindent  "�ڵ� �鿩���� on

set smartindent "�� �� ����Ʈ�� �鿩���� ��� on

set title       "Ÿ��Ʋ �ٿ� ���� �������� ���ϸ� ǥ��

set paste! "�ٿ��ֱ�� ������� ����

filetype off "������ ������ �ڵ����� �ν�
filetype plugin on "������ ������ �ڵ����� �ν�

"set complets "�ڵ��ϼ�"
"
""====== Tlist =====
"- �±� ����(�Լ�, ��ũ��, ����ü ��)�� ǥ��
let Tlist_Display_Tag_Scope = 1
""- �Լ� ������ ǥ��
let Tlist_Display_Prototype = 1
"- �±� ����Ʈ ���� (�ҽ� �ڵ� ��ġ ������ �ƴ� �̸� ������ ǥ��)
let Tlist_Sort_Type = "name"
""- �±� ����Ʈ â�� ������ ǥ��
"let Tlist_Use_Right_Window = 1
""- �±� ����Ʈ â�� ���� 35���ڷ� ����
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
