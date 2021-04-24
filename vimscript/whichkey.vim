" Which key

" Shorter delay
set timeoutlen=100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey '<CR>'<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual '<CR>'<CR>

" Create map to add keys to
let g:which_key_map = {}
let g:which_key_map_local = {}
let g:which_key_map_cw = {}

" Hide status bar
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode signcolumn=no
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode signcolumn=yes

" Floating windows are quite ugly for some reason
let g:which_key_use_floating_win = 0

" Leader mappings
let g:which_key_map['q'] = [ ':BufferClose'               , 'close file' ]
let g:which_key_map['e'] = [ ':NvimTreeFindFile'          , 'tree on current' ]
let g:which_key_map['E'] = [ ':NvimTreeToggle'            , 'toggle tree' ]
let g:which_key_map['m'] = [ ':make'                      , 'make' ]
let g:which_key_map['c'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'd' : [':bd', 'delete'],
            \ 'f' : [':Buffers', 'find'],
            \ 'l' : [':blast', 'last'],
            \ 'c' : [':Bdelete hidden', 'clean'],
            \}

let g:which_key_map['b'] = {
            \ 'name' : '+buffers',
            \ 'c' : [':BufferClose', 'close'],
            \ 'C' : [':Bdelete hidden', 'clean'],
            \ 'n' : [':BufferMoveNext', 'move next'],
            \ 'p' : [':BufferMovePrevious', 'move prev'],
            \ 'l' : [':BufferLast', 'last'],
            \ 'od' : [':BufferOrderByDirectory', 'order by dir'],
            \ 'ol' : [':BufferOrderByLanguage', 'order by lang'],
            \ 'g' : [':BufferPick', 'goto'],
            \}

" Register maps
call which_key#register('<Space>', "g:which_key_map")
call which_key#register('<CR>', "g:which_key_map_local")
