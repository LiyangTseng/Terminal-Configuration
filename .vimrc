syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set incsearch

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/ " set the runtime path to include Vundle and initialize

set encoding=UTF-8 "nerdtree-syntax-highlight

call vundle#begin()

" remap jj to <Esc>"
inoremap jj <Esc>  

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " required

" gruvbox "
colorscheme gruvbox
set background=dark


" YoucompleteMe "
let g:ycm_show_diagnostics_ui=0 
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_confirm_extra_conf=0 
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_c-c++_conf.py'

let g:ycm_python_binary_path='/usr/bin/python3'

" ctrlp vim "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_show_hidden = 1  "this line to find hidden files, but really slow

" nerdtree "
nnoremap <F5> :NERDTreeToggle<CR>

" nerdtree syntax highlight "
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" nerdtree-git-plugin "
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"asynchronous lint engine"
"始終開啟標誌列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定義error和warning圖示
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自帶的狀態列中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"顯示Linter名稱,出錯或警告等相關資訊
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一個錯誤或警告，sn前往下一個錯誤或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s觸發/關閉語法檢查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d檢視錯誤或警告的詳細資訊
nmap <Leader>d :ALEDetail<CR>
"檔案內容發生變化時不進行檢查
let g:ale_lint_on_text_changed = 'never'
"開啟檔案時不進行檢查
let g:ale_lint_on_enter = 0
"使用clang對c和c++進行語法檢查，對python使用pylint進行語法檢查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
