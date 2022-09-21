" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @xxc



" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:plug_window = '-tabnew'
let g:plug_pwindow = 'vertical rightbelow new'

" ==================== Editor behavior ====================
"kitty 可能需要的配置
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"filetype on
set nocompatible
filetype plugin indent on
set clipboard=unnamedplus
let &t_ut=''
set autochdir
set exrc
set secure
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
set colorcolumn=100
set updatetime=100
set virtualedit=block

" ==================== Basic Mappings ====================
let mapleader=" "
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $MYVIMRC<CR>
" reflash the vimrc file anytime
nnoremap <LEADER>sv :so $MYVIMRC<CR>

nnoremap Q :q<CR>
nnoremap S :w<CR>


" Search 正常模式下按 空格+回车 取消高亮显示 
nnoremap <LEADER><CR> :nohlsearch<CR>

" 插入模式下上下左右的映射
inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-j> <down>
inoremap <A-k> <up>

" buffer 相关
nnoremap ,b :ls<CR>
nnoremap ,n :bnext<CR>
nnoremap ,m :bprevious<CR>

" tab 相关
nnoremap ,N :tabnext<CR>
nnoremap ,M :tabprevious<CR>

" 使用 jk  进入 normal 模式
inoremap jk <Esc>`^

" ==================== Plug install ====================
call plug#begin('~/.config/nvim/plugged')
"  中文文档
Plug 'yianwillis/vimcdoc'
" ===
" === theniceboy
" ===
Plug 'theniceboy/nvim-deus'
Plug 'theniceboy/vim-snippets'

" ===
" === junegunn
" ===
" help for vim-plug
Plug 'junegunn/vim-plug'
" fzf finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 粘贴板历史
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-emoji'

"==================
"  状态栏
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'


"  coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree
Plug 'mbbill/undotree'

" markdown 
"  如果出现报错,nvim包里面执行yarn install 然后回来重装即可
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install',
																			\'for': 'markdown', 'on': 'MarkdownPreview' }

" 自动序列
Plug 'dkarter/bullets.vim'
"markdown toc title
Plug 'mzlogin/vim-markdown-toc',{'for': 'markdown' }

" markdown table
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

" vimwiki 
Plug 'vimwiki/vimwiki'


" git相关
Plug 'airblade/vim-gitgutter'

" nvim-treesitter/nvim-treesitter
" require gcc-c++ and libstdc++ on your system 
Plug 'nvim-treesitter/nvim-treesitter'


" vimspector 
Plug 'puremourning/vimspector',{'for':'python'}

" 自动补全括号的输入
Plug 'jiangmiao/auto-pairs'


" 开启终端插件
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()


" ==================== 皮肤和状态栏 ====================
"set termguicolors " enable true colors support
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! color deus
hi NonText ctermfg=gray guifg=grey10

" ==================== statusline ==================
" 3: always and ONLY the last window
set laststatus=3
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

" ==================== coc.nvim====================
let g:coc_global_extensions = [
			\ 'coc-json',
			\ 'coc-vimlsp',
			\ 'coc-pyright',
			\ 'coc-explorer',
			\ 'coc-lists',
			\ 'coc-sh',
			\ 'coc-snippets']



" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


"""" Use <C-j> for select text for visual placeholder of snippet.
"""vmap <c-j> <Plug>(coc-snippets-select)
"""
"""" Use <C-j> for both expand and jump (make expand higher priority.)
"""imap <c-j> <Plug>(coc-snippets-expand-jump)
"""
"""" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"""let g:coc_snippet_next = '<c-j>'
"""
"""" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"""let g:coc_snippet_prev = '<c-k>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ==================== Undotree ====================
noremap L :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 24
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 8
"  Usually, I would like to store the undo files in a separate place like below.
if has("persistent_undo")
  let target_path = expand('~/.config/nvim/.undodir')
   " create the directory and any parent directories
   " if the location does not exist.
   if !isdirectory(target_path)
       call mkdir(target_path, "p", 0700)
   endif
   let &undodir=target_path
   set undofile
endif

" =================== coc-nvim map ==============
nnoremap tt :CocCommand explorer<CR>
" yank map
"nnoremap <silent> <LEADER><LEADER>b  :<C-u>CocList -A --normal buffers<CR>

" ==================== Markdown Settings ====================
" =================== preview  ==========
" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = 'chromium'

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '$HOME/.config/nvim/css/github-markdown.css'


"======================== vim-table-mode ==============================
nnoremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_corner='|'


" ==================== Bullets.vim ====================
" Bullets.vim
let g:bullets_enabled_file_types = [
	\ 'markdown',
	\ 'text',
	\ 'gitcommit',
	\ 'scratch'
	\]

"markdown Snippets ============================================
source $HOME/.config/nvim/md-snippets.vim

" ==================== vim-markdown-toc ====================
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ==== vimwiki 
let g:vimwiki_list = [{'path': '~/vimwiki/','ext': '.md'}]

let g:vim_markdown_math = 1
let g:vimwiki_global_ext = 0
autocmd FileType vimwiki set syntax=markdown

"" 将默认的<tab>来找下一个link替换成其它键
"nmap <F21> <Plug>VimwikiNextLink 
"" 将默认的<tab>来找上一个link替换成其它键
"nmap <F22> <Plug>VimwikiPrevLink 

" ==================== GitGutter ====================
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_removed_first_line = '羅'
let g:gitgutter_sign_modified_removed = emoji#for('collision')
"nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
"nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
"nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ==================== nvim-treesitter ===========================
lua <<EOF
require("nvim-treesitter.install").prefer_git = true
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"vim", "python", "json", "c", "bash", "go","lua","markdown"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "rust" },  -- list of language that will be disabled
	},
}
EOF

"=====================fzf.vim==============
"Dependencies
"
"    fzf 0.23.0 or above
"    For syntax-highlighted preview, install bat
"    If delta is available, GF?, Commits and BCommits will use it to format git diff output.
"    Ag requires The Silver Searcher (ag)
"    Rg requires ripgrep (rg)
"    Tags and Helptags require Perl
"-----------------------------------------
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

" toggleterm 终端插件
lua <<EOF
require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 15,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = "/bin/fish", -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "single",
    height = 100,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}

-- Terminal window mappings

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

EOF


" ================================ 好用的脚本 ============================

" 记录上一次文件修改光标的位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" =================== Compile function ==========

" Compile function
nnoremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
	endif
endfunc


" ===
" === my function
" ===

"====中文字数统计函数，call出来使用，要进入可视模式全选。。
function! ChineseCount() range
let save = @z
silent exec 'normal! gv"zy'
let text = @z
let @z = save
silent exec 'normal! gv'
let cc = 0
for char in split(text, '\zs')
if char2nr(char) >= 0x2000 
let cc += 1
endif
endfor
echo "Count of Chinese charasters is:"
echo cc
endfunc

""""vnoremap <F7> :call ChineseCount()<cr>


"===========中英文切换
"退出插入模式时禁用输入法
autocmd InsertLeave * :silent !fcitx5-remote -c
"创建 Buf 时禁用输入法
autocmd BufCreate *  :silent !fcitx5-remote -c
"进入 Buf 时禁用输入法
autocmd BufEnter *  :silent !fcitx5-remote -c
"离开 Buf 时禁用输入法
autocmd BufLeave *  :silent !fcitx5-remote -c




" ===
" === my command
" ===

command! -nargs=0 Time exec 'r !date'



" Python自动插入文件标题
 autocmd BufNewFile *py exec ":call SetPythonTitle()"
 func SetPythonTitle()
  call setline(1,"# -*- coding: utf-8 -*-")
  call append(line("."), "")
  call append(line(".")+1, "\# @Time: ".strftime("%Y-%m-%d",localtime()))
  call append(line(".")+2, "\# @Author: Nick")
  call append(line(".")+3, "\# @Description: All cash is equal")
 endfunc
"新建文件后，自动定位到文件末尾
 autocmd BufNewFile * normal G o



" ====== vimspector 
let g:vimspector_install_gadgets = [ 'debugpy']
"let g:vimspector_enable_mappings = 'HUMAN'

nnoremap ++ :VimspectorReset<CR>

nnoremap <leader>dc <Plug>VimspectorContinue
nnoremap <leader>dp <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dP :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dj <Plug>VimspectorStepOver
nnoremap <leader>dr <Plug>VimspectorRestart
nnoremap <leader>dt <Plug>VimspectorStop




" vimspector 自动导入dbug 配置模板,vimspector.json,对接debugpy
function! s:read_template_into_buffer(template)
  " has to be a function to avoid the extra space fzf#run insers otherwise
  execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
      \   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
      \   'down': 20,
      \   'sink': function('<sid>read_template_into_buffer')
      \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=🛑 texthl=Normal
sign define vimspectorBPDisabled text=🚫 texthl=Normal
sign define vimspectorPC text=👉 texthl=SpellBad

