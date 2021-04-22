" Neoformat

augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--format-invalid-files=auto', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

" Set implementation or interface flag for Eliom
autocmd BufEnter *.eliomi let g:neoformat_ocaml_ocamlformat['args'] = ['--enable-outside-detected-project', '--format-invalid-files=auto', '--name', '"%:p"', '--intf', '-']
autocmd BufEnter *.eliom let g:neoformat_ocaml_ocamlformat['args'] = ['--enable-outside-detected-project', '--format-invalid-files=auto', '--name', '"%:p"', '--impl', '-']
