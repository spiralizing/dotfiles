" vim: fdm=marker

" ============================================================================
"        _                                          _____
" _   __(_)___ ___  __________    _________  ____  / __(_)___ _
"| | / / / __ `__ \/ ___/ ___/   / ___/ __ \/ __ \/ /_/ / __ `/
"| |/ / / / / / / / /  / /__    / /__/ /_/ / / / / __/ / /_/ /
"|___/_/_/ /_/ /_/_/   \___/____\___/\____/_/ /_/_/ /_/\__, /
"                         /_____/                     /____/
"
"   /  |/  /__  /  / / / /
"  / /|_/ /  / /  / /_/ /
" / /  / /  / /__/ __  /
"/_/  /_/  /____/_/ /_/
"
" Author: Martin Zumaya, June 2020
"
" ============================================================================
" Neovim default {{{1
" ============================================================================
if 0 | endif

if &compatible
    set nocompatible
endif
"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0

" ============================================================================
" Plugins {{{1
" ============================================================================

call plug#begin('~/.local/share/nvim/plugged')

" Version Control
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" gives us lists of key bindings
Plug 'liuchengxu/vim-which-key'

" Colorschemes
Plug 'chuling/equinusocio-material.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/forest-night'
Plug 'skbolton/embark'
Plug 'joshdick/onedark.vim'
Plug 'hardcoreplayers/oceanic-material'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" UI Layout
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'itchyny/lightline.vim'
Plug 'pacha/vem-tabline'
" Plug 'enricobacis/vim-airline-clock'
" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Terminal
Plug 'kassio/neoterm'
Plug 'jpalardy/vim-slime'
Plug 'ncm2/float-preview.nvim'

" Autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/neovim-remote'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Language Server Protocol
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'

" File manager
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Code Navigation
Plug 'myusuf3/numbers.vim'
" Plug 'unblevable/quick-scope'
" Plug 'jlanzarotta/bufexplorer'

" Writing
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'chaoren/vim-wordmotion'
Plug 'easymotion/vim-easymotion'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'sbdchd/vim-shebang'
" Plug 'mattn/emmet-vim'

" Syntax
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'ivanov/vim-ipython'

" Tags
Plug 'majutsushi/tagbar'

" Julia related
Plug 'mroavi/vim-julia-cell'
Plug 'JuliaEditorSupport/julia-vim'

" Taskwarrior and Wiki
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'blindFS/vim-taskwarrior'
Plug 'vimwiki/vimwiki', { 'as' : 'vimwiki', 'branch' : 'dev'}
Plug 'tbabej/taskwiki'

call plug#end()

" ============================================================================
" Basic settings and maps {{{1
" ============================================================================
syntax enable
filetype plugin indent on
filetype plugin on

set hidden
set autoread
set linebreak
set expandtab
set cursorline
set splitright
set noshowmode

set shell=zsh
set shiftwidth=4
set softtabstop=4
set textwidth=110
set colorcolumn=114

let g:highlightedyank_highlight_duration = 500
let g:airline#extensions#tabline#enabled = 1

" Set up leader key
let mapleader = "\<Space>"

" Clear highlighted search
nmap <silent> ,/ :nohlsearch<CR>

" Substitute word in cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Duplicate lines
nnoremap zj mzyyP`z
nnoremap zk mzyyP`zk
nnoremap <Leader>uf :! bash ~/Code/Collaborations/patchyenzimes/cluster_scripts/bash_scripts/rsync_figs.sh<CR>

" ============================================================================
" Which Key {{{1
" ============================================================================

set timeoutlen=500

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

" which key can't figure out the easy-motion mappings
let g:which_key_map = {" ": 'easy motion (re-input to use)'}

" ============================================================================
" UI Config {{{1
" ============================================================================

set encoding=utf8
" set background=dark

" Don't let terminal override my vim settings
" set notermguicolors

if has('nvim') || has('termguicolors')
  set termguicolors
endif

" let t_Co = 256
" set guifont=IBM\ Plex\ Mono:h14

" let g:oceanic_material_transparent_background=1
" let g:oceanic_material_allow_bold=1
" let g:oceanic_material_allow_italic=1
" let g:oceanic_material_allow_uderline=1
" let g:oceanic_material_allow_udercurl=1
" let g:oceanic_material_allow_reverse=1
" colorscheme oceanic_material


" use the best vertsplit char
set fillchars+=vert:│
let g:equinusocio_material_style = 'darker'
" " let g:equinusocio_material_bracket_improved = 1
colorscheme equinusocio_material

" the configuration options should be placed before `colorscheme sonokai`
" let g:sonokai_enable_italic = 1
" let g:sonokai_style = 'atlantis'
" colorscheme sonokai

" let g:edge_enable_italic = 1
" let g:edge_style = 'neon'
" colorscheme edge

" let g:forest_night_enable_italic = 1
" colorscheme forest-night

" colorscheme onedark
" colorscheme embark
" colorscheme challenger_deep

" Remove background
" hi Normal guibg=NONE ctermbg=NONE

" Indent line level indicators
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:lightline = {
    \ 'colorscheme': 'equinusocio_material',
    \ 'enable': {'tabline': 0},
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
                \ ['gitbranch', 'gitstatus', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component': {
        \ 'gitstatus': '%<%{lightline_gitdiff#get_status()}',
    \ },
    \ 'component_visible_condition': {
        \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
    \ },
    \ 'component_function': {
        \ 'gitbranch': 'FugitiveHead'
    \ },
\ }

" let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
" let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
" let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }

let g:lightline_gitdiff#indicator_added = '▴'
let g:lightline_gitdiff#indicator_deleted = '▾'
let g:lightline_gitdiff#indicator_modified = '▸'
let g:lightline_gitdiff#min_winwidth = '70'

let g:vem_tabline_show=2
let g:vem_tabline_show_icon=1
let g:vem_tabline_multiwindow_mode=1
let g:vem_tabline_show_number='index'

nmap <leader>h <Plug>vem_move_buffer_left-
nmap <leader>l <Plug>vem_move_buffer_right-
nmap <leader>p <Plug>vem_prev_buffer-
nmap <leader>n <Plug>vem_next_buffer-

nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>

function! DeleteCurrentBuffer() abort
    let current_buffer = bufnr('%')
    let next_buffer = g:vem_tabline#tabline.get_replacement_buffer()
    try
        exec 'confirm ' . current_buffer . 'bdelete'
        if next_buffer != 0
            exec next_buffer . 'buffer'
        endif
    catch /E516:/
       " If the operation is cancelled, do nothing
    endtry
endfunction
nmap <leader>d :call DeleteCurrentBuffer()<CR>

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme="onedark"

" ============================================================================
" NERDTree {{{1
" ============================================================================

" autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=50
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! nmap <C-\> :NERDTreeFocus<CR>

" ============================================================================
" CPP Config {{{1
" ============================================================================

let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" ============================================================================
" NERDcommenter {{{1
" ============================================================================

" Add a space between comment delimiter and comment
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" ============================================================================
" Snippets {{{1
" ============================================================================

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" ============================================================================
" EasyAlign {{{1
" ============================================================================

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ============================================================================
" Whitespace {{{1
" ============================================================================

let g:better_whitespace_enabled=1
let g:better_whitespace_operator='_s'
let g:better_whitespace_skip_empty_lines=1
" let g:strip_whitespace_on_save=1

" nnoremap ]w :NextTrailingWhitespace<CR>
" nnoremap [w :PrevTrailingWhitespace<CR>

" ============================================================================
" Easymotion {{{1
" ============================================================================
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ============================================================================
" Wordmotion {{{1
" ============================================================================

let g:wordmotion_prefix = ','

" ============================================================================
" Surround and Autopairs {{{1
" ============================================================================

map ss ysiw
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<A-b>'

" ============================================================================
" TaskWiki and VimWiki {{{1
" ============================================================================

autocmd FileType vimwiki setlocal textwidth=100
autocmd FileType vimwiki setlocal colorcolumn=105

let g:task_rc_override = 'rc.defaultheight=0'

let wiki_1 = {}
let wiki_1 = {}
let wiki_1.path = "~/vimwiki/"
let wiki_1.syntax = 'markdown'
let wiki_1.index = 'index'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = "~/vimwiki/diary"
let wiki_2.syntax = 'markdown'
let wiki_2.index = 'diary'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]

let g:taskwiki_markup_syntax="markdown"
nnoremap <Leader>td :TaskWikiDone<CR>

" ============================================================================
" Version Control {{{1
" ============================================================================

set updatetime=30

let g:signify_sign_add = '▴'
let g:signify_sign_delete = '▾'
let g:signify_sign_delete_first_line = '▪'
let g:signify_sign_change = '▸'

let g:signify_sign_show_count = 0

let g:NERDTreeShowIgnoredStatus=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ============================================================================
" FZF {{{1
" ============================================================================

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
map <leader>bl :BLines<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

" Always enable preview window on the right with 60% width
" let g:fzf_preview_window = 'right:60%'

" Border color
" let g:fzf_layout = {
"     \ 'up':'~90%',
"     \ 'window': {
"     \ 'width': 0.8,
"     \ 'height': 0.8,
"     \ 'yoffset':0.5,
"     \ 'xoffset': 0.5,
"     \ 'highlight': 'Todo',
"     \ 'border': 'sharp' }
"     \ }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword',
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt     = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command  = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Autocomplete {{{1
" ============================================================================

lua << EOF
    local nvim_lsp = require'nvim_lsp'
    local on_attach_vim = function()
        require'diagnostic'.on_attach()
        require'completion'.on_attach()
    end
    nvim_lsp.julials.setup({on_attach=on_attach_vim})
EOF

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc

let g:diagnostic_auto_popup_while_jump = 0
let g:diagnostic_enable_virtual_text = 1
" let g:diagnostic_trimmed_virtual_text = '20'
let g:diagnostic_enable_underline = 1
let g:diagnostic_insert_delay = 1

let g:completion_auto_change_source = 1
let g:completion_timer_cycle = 200 "default value is 80
let g:completion_enable_snippet = 'UltiSnips'

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

" let g:completion_confirm_key = "\<C-y>"
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Preview
set completeopt-=preview
let g:float_preview#docked = 0

function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

autocmd User FloatPreviewWinOpen call DisableExtras()

" Terminal {{{1
" ============================================================================

" Where should the terminal open
let g:neoterm_default_mod = ':vertical'
let g:neoterm_keep_term_open = 1
let g:neoterm_autoscroll=1

" Commands to deal with the terminal
nnoremap <silent> <leader>to :Topen<CR>
nnoremap <silent> <leader>tc :Tclose<CR>
nnoremap <silent> <leader>tt :Ttoggle<CR>
nnoremap <silent> <leader>tk :Tkill<CR>
nnoremap <silent> <leader>tl :Tclear<CR>
nnoremap <silent> <leader>ts :T %:p<CR>
nnoremap <silent> <leader>tp :T python %:p<CR>
nnoremap <silent> <leader>tj :T julia<CR>
"
" silent! nmap <C-l> :TREPLSendLine<CR>
" silent! vmap <C-s> :TREPLSendSelection<CR>

" Easily change from insert to normal mode on a terminal
tnoremap <Esc> <C-\><C-n>

" Neoterm mappings

" ============================================================================
" Julia Related {{{1
" ============================================================================

autocmd FileType julia setlocal textwidth=100
autocmd FileType julia setlocal colorcolumn=105

" fix Julia highlighting
autocmd BufRead,BufNewFile *.jl set filetype=julia
" let g:latex_to_unicode_keymap = 1

" Use '##' tags to define cells
let g:julia_cell_delimit_cells_by = 'tags'
" map <Leader>jr to run entire file
nnoremap <Leader>jr :JuliaCellRun<CR>
" map <Leader>jl to clear Julia screen
nnoremap <Leader>jl :JuliaCellClear<CR>
" map <Leader>jp and <Leader>jn to jump to the previous and next cell header
nnoremap <Leader>jp :JuliaCellPrevCell<CR>
nnoremap <Leader>jn :JuliaCellNextCell<CR>

" map <Leader>jc to execute the current cell
" nnoremap <Leader>jc :JuliaCellExecuteCell<CR>
" map <Leader>jC to execute the current cell and jump to the next cell
" nnoremap <Leader>jC :JuliaCellExecuteCellJump<CR>

let g:slime_cell_delimiter = "##"

" let g:slime_target = 'neovim'
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_dont_ask_default = 1

nmap <Leader>js <Plug>SlimeLineSend
xmap <Leader>js <Plug>SlimeRegionSend
nmap <Leader>jc <Plug>SlimeSendCell

" nmap <C-s> <Plug>SlimeLineSend
" xmap <C-s> <Plug>SlimeRegionSend
" nmap <C-a> <Plug>SlimeSendCell

" Clears jlia REPL
autocmd FileType julia nmap <C-l> :silent !tmux send-keys -t "{right-of}" C-l <cr>

" activate tagbar
nmap <Leader>tb :TagbarToggle<CR>

" ctags config location
let g:tagbar_ctags_options = ['NONE', $HOME.'/.config/ctags']

" tagbar for Julia
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }

" Iron.nvim
" let g:which_key_map.r = {'name': 'REPL interaction (iron)'}

" nmap <localleader>rt    <Plug>(iron-send-motion)
" let g:which_key_map.r.t = 'motion send'
" vmap <localleader>rv    <Plug>(iron-visual-send)
" let g:which_key_map.r.v = 'visual send'
" nmap <localleader>rr    <Plug>(iron-repeat-cmd)
" let g:which_key_map.r.r = 'repeat command'
" nmap <localleader>rl    <Plug>(iron-send-line)
" let g:which_key_map.r.l = 'send line'
" nmap <localleader>r<CR> <Plug>(iron-cr)
" let g:which_key_map.r.CR = 'carriage return'
" nmap <localleader>ri    <plug>(iron-interrupt)
" let g:which_key_map.r.i = 'interrupt'
" nmap <localleader>rq    <Plug>(iron-exit)
" let g:which_key_map.r.q = 'exit'
" nmap <localleader>rc    <Plug>(iron-clear)
" let g:which_key_map.r.c = 'clear'
"
" nnoremap <Leader>rr :IronRepl<CR>
" let g:which_key_map.r.r = 'start REPL'

" ============================================================================
" LaTeX {{{1
" ============================================================================

autocmd FileType tex setlocal textwidth=100
autocmd FileType tex setlocal colorcolumn=105

nnoremap <silent> <leader>lc :VimtexCompile<CR>
nnoremap <silent> <leader>lv :VimtexView<CR>
nnoremap <silent> <leader>lo :VimtexTocOpen<CR>
nnoremap <silent> <leader>lt :VimtexTocToggle<CR>

let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:tex_conceal = ""

let g:tex_flavor = "pdflatex"
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
"             \ 'tex': g:vimtex#re#deoplete
"             \})

let g:vimtex_compiler_latexmk = {
         \ 'build_dir' : 'build',
         \}

" Skim config
let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']

    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif

    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescpe(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

" TOC settings
"let g:vimtex_toc_config = {
"      \ 'name' : 'TOC',
"      \ 'layers' : ['content', 'todo', 'include'],
"      \ 'resize' : 1,
"      \ 'split_width' : 50,
"      \ 'todo_sorted' : 0,
"      \ 'show_help' : 1,
"      \ 'show_numbers' : 1,
"      \ 'mode' : 2,
"      \}

" ============================================================================
" Buffers {{{1
" ============================================================================

command! -nargs=+ Bs :vert sbuffer <args>

" nnoremap <C-D-<Down>>  <C-W><C-J>
" nnoremap <C-D-<Up>>    <C-W><C-K>
" nnoremap <C-D-<Right>> <C-W><C-L>
" nnoremap <C-D-<Left>>  <C-W><C-H>

" Commands to deal with the buffers without going all the way through the
" colon
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>ls :ls<CR>
nnoremap <silent> <leader>bs1 :Bs 1<CR>
nnoremap <silent> <leader>bs2 :Bs 2<CR>
nnoremap <silent> <leader>bs3 :Bs 3<CR>
nnoremap <silent> <leader>bs4 :Bs 4<CR>
nnoremap <silent> <leader>bs5 :Bs 5<CR>

" ============================================================================
" Workspace {{{1
" ============================================================================

" nnoremap <leader>w :ToggleWorkspace<CR>
" let g:workspace_create_new_tabs = 0
" let g:workspace_session_disable_on_args = 1
" let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'
