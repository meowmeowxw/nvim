call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
	let g:startify_bookmarks = [{'c': '~/.config/nvim/init.vim'},
				\ {'f': '~/.config/fish/config.fish'},
				\ {'t': '~/.config/kitty/kitty.conf'},
				\ {'z': '~/.zshrc'}]
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
    map <space>n :NERDTreeToggle<CR>
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && 
                \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | 
                \ exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
                \ b:NERDTree.isTabTree()) | q | endif
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'terryma/vim-multiple-cursors'
Plug 'petRUShka/vim-sage'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    map <space>b :Buffers<CR>
    map <space>f :Files<CR>
    map <space>gf :GFiles<CR>
    map <space>m :Marks<CR>
    map <space>l :Lines<CR>
    map <space>g :Rg<CR>
    map <space>t :BTags<CR>
    map <space>p :Tags<CR>
    map <space>j :jumps<CR>
    map <space>w :Windows<CR>
Plug 'matze/vim-move'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    map <space>y :Clap yanks<CR>
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
	nnoremap <silent> <space> :WhichKey '<space>'<CR>
	set timeoutlen=600

" Colorschemes
Plug 'rebelot/kanagawa.nvim'
Plug 'savq/melange-nvim'
Plug 'ribru17/bamboo.nvim'
Plug 'sainnhe/sonokai'
	let g:sonokai_style = 'atlantis'
Plug 'sainnhe/edge'
	let g:edge_style = 'neon'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
    let g:gruvbox_material_background = 'medium'
Plug 'joshdick/onedark.vim'
    let g:onedark_terminal_italics = 1
Plug 'ayu-theme/ayu-vim' " or other package manager
	let ayucolor="mirage" " for mirage version of theme
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

"Plug 'meowmeowxw/eleline.vim'
    "let g:airline_powerline_fonts = 1
" Plug 'meowmeowxw/lightline.vim'
" 
" let g:lightline = {
"     \ 'colorscheme': 'jellybeans',
"     \ 'active': {
"     \   'left': [ [ 'bufnr' ],
"     \           [ 'mode', 'paste' ],
"     \           [ 'filetype', 'gitbranch', 'readonly', 'modified' ] ],
"     \   'right': [ [ 'lineinfo' ],
"     \            [ 'percent' ],
"     \            [ 'fileencoding' ] ]
"     \},
"     \ 'inactive': {
"     \   'left': [ [ 'bufnr' ],
"     \             [ 'readonly', 'filename', 'modified' ] ]
"     \ },
"     \ 'component_function': {
"     \	  'bufnr': 'BufNr',
"     \   'gitbranch': 'GitBranch',
"     \   'filetype': 'FileType',
"     \ },
"     \ 'component': {
"     \   'readonly': '%{&readonly?"":""}',
"     \   'fileencoding' : '%{&fileencoding} %{WebDevIconsGetFileFormatSymbol()}'
"     \ },
"     \ 'separator': { 'left': '', 'right': '' },
"     \ 'subseparator': { 'left': '', 'right': '' },
"     \ 'mode_map': {
"     \ 'n' : '<N>',
"     \ 'i' : '<I>',
"     \ 'R' : '<R>',
"     \ 'v' : '<V>',
"     \ 'V' : '<Vl>',
"     \ "\<C-v>": '<Vb>',
"     \ 'c' : '<C>',
"     \ 's' : '<S>',
"     \ 'S' : '<Sl>',
"     \ "\<C-s>": '<Sb>',
"     \ 't': '<T>',
"     \ },
" \ }

"Plug 'tpope/vim-sleuth'
Plug 'georgewitteman/vim-fish'
Plug 'lervag/vimtex'

call plug#end()

function! BufNr() abort
	let l:bufnr = bufnr('%')
	let l:bufnr = l:bufnr > 20 ? l:bufnr : nr2char(9311 + l:bufnr).' '
	return '  '.l:bufnr."  ".winnr().' '
endfunction

function! FileType() abort
	let l:f = WebDevIconsGetFileTypeSymbol()
	return ''.expand('%:p:t').' '.l:f.''
endfunction

function! GitBranch() abort
	let _ = FugitiveHead()
	return strlen(_) ? _.'  ' : ''
endfunction

" Nvim behaviour
syntax on
filetype plugin on
set background=dark
set termguicolors
colorscheme gruvbox-material
" colorscheme tender
" colorscheme melange
set hls!
set laststatus=2
set tabstop=4
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set splitbelow
set splitright
set noshowmode
set scrolloff=5
set cursorline
set colorcolumn=80
set nofoldenable
set number relativenumber
"
" Custom Shortcuts
nmap D d$
nmap Y y$
nmap H i<CR><Esc>
nmap gh ^
nmap gl $
nmap <F8> :Vista!!<CR>
nmap <space>i m1gg=G'1
nmap <space>v :vsplit term://$SHELL<CR>
nmap <space>x :split term://$SHELL<CR>
nmap <space>s $]}V[{
nmap <space>S ^V[{
nmap <space>ss :Startify<CR>
nmap <space>- :split<CR>
nmap <space>\ :vsplit<CR>
nmap <space>wl <C-W>l
nmap <space>wh <C-W>h
nmap <space>wj <C-W>j
nmap <space>wk <C-W>k
nmap <space>cc :CocCommand<CR>
nmap ]t :tabn<CR>
nmap [t :tabp<CR>

map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc ><CR>
map <C-L> :5winc <<CR>
map <A-M> :%norm.<CR>

vmap s y:let @/ = @"<CR>

nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>r :g/^\s*$/d<CR>
nnoremap <Leader>k :Man<CR>
tnoremap <Esc> <C-\><C-n>
"
" Properties for terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd StdinReadPre * let s:std_in=1
"
" Relative line numbers in normal mode, absolute line numbers in insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" CoC config
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

lua <<EOF
	require'nvim-treesitter.configs'.setup {
	  ensure_installed = "all",     -- one of "all", "language", or a list of languages
	  highlight = {
		enable = true              -- false will disable the whole extension
	  },
	}
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '|', right = '|'},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
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
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
EOF
