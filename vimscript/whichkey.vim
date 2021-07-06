" Which key

" Shorter delay
set timeoutlen=100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}

" Hide status bar
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode signcolumn=no
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode signcolumn=yes

" Floating windows are quite ugly for some reason
let g:which_key_use_floating_win = 0

" Leader mappings
let g:which_key_map['s'] = [ ':SessionSave'                 , 'save session' ]
let g:which_key_map['S'] = [ ':SessionLoad'                 , 'load session' ]
let g:which_key_map['q'] = [ ':BufferClose'                 , 'close file' ]
let g:which_key_map['e'] = [ ':NvimTreeFindFile'            , 'tree on current' ]
let g:which_key_map['E'] = [ ':NvimTreeToggle'              , 'toggle tree' ]
let g:which_key_map['c'] = [ '<Plug>NERDCommenterToggle'    , 'comment' ]
let g:which_key_map['t'] = [ ':Telescope'                   , 'telescope' ]
let g:which_key_map[':'] = [ ':Telescope command_history'   , 'find command' ]

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'c' : [':BufferClose',                'close'],
            \ 'C' : [':Bdelete hidden',             'clean'],
            \ 'n' : [':BufferMoveNext',             'move next'],
            \ 'p' : [':BufferMovePrevious',         'move prev'],
            \ 'l' : [':BufferLast',                 'last'],
            \ 'D' : [':BufferOrderByDirectory',     'order by dir'],
            \ 'L' : [':BufferOrderByLanguage',      'order by lang'],
            \ 'g' : [':BufferPick',                 'goto'],
            \}

let g:which_key_map['f'] = {
            \ 'name' : '+find',
            \ 'f' : [':Telescope find_files',       'files'],
            \ 'g' : [':Telescope git_files',        'git files'],
            \ 'b' : [':Telescope current_buffer_fuzzy_find', 'buffer find'],
            \ 'B' : [':Telescope file_browser',     'browse'],
            \ 'G' : [':Telescope live_grep',        'grep'],
            \ 'R' : [':Telescope reloader',         'reload'],
            \ 'q' : [':Telescope quickfix',         'quickfix list'],
            \ 'l' : [':Telescope loclist',          'location list'],
            \}

let g:which_key_map['g'] = {
            \ 'name' : '+git',
            \ 'a' : [':Gina add %',                 'add'],
            \ 'b' : [':Gina blame',                 'blame'],
            \ 'c' : [':Gina commit',                'commit'],
            \ 'C' : [':Gina commit --amend',        'amend'],
            \ 's' : [':Gina status',                'status'],
            \}

let g:which_key_map['g']['l'] = {
            \ 'name' : '+list',
            \ 'c' : [':Telescope git_commits',      'commits'],
            \ 'C' : [':Telescope git_bcommits',     'buffer commits'],
            \ 'b' : [':Telescope git_branches',     'branches'],
            \ 's' : [':Telescope git_status',       'status'],
            \}

let g:which_key_map['h'] = {
            \ 'name' : '+hunks',
            \ 's' : [':Gitsigns stage_hunk',        'stage'],
            \ 'u' : [':Gitsigns undo_stage_hunk',   'undo stage'],
            \ 'r' : [':Gitsigns reset_hunk',        'reset'],
            \ 'R' : [':Gitsigns reset_buffer',      'reset buffer'],
            \ 'v' : [':Gitsigns preview_hunk',      'preview'],
            \ 'b' : [':Gitsigns blame_line',        'blame'],
            \ 'n' : [':Gitsigns next_hunk',         'next'],
            \ 'p' : [':Gitsigns prev_hunk',         'prev'],
            \}

let g:which_key_map['l'] = {
            \ 'name' : '+lsp',
            \ 'a' : [':Telescope lsp_code_actions',             'action'],
            \ 'r' : [':Lspsaga rename',                         'rename'],
            \ 'f' : [':Lspsaga lsp_finder',                     'finder'],
            \ 'p' : [':Lspsaga preview_definition',             'preview definition'],
            \ 's' : [':Telescope lsp_document_symbols',         'symbols'],
            \ 'S' : [':Telescope lsp_workspace_symbols',        'workspace symbols'],
            \ 'd' : [':Telescope lsp_document_diagnostics',     'diagnostics'],
            \ 'D' : [':Telescope lsp_workspace_diagnostics',    'workspace diagnostics'],
            \}

" Register maps
call which_key#register('<Space>', "g:which_key_map")
