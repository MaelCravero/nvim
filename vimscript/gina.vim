" Gina

let g:gina#command#blame#formatter#format = "%au: %su%=on %ti %ma%in"

" Echo chunk info with j/k
call gina#custom#mapping#nmap(
            \ 'blame', 'j',
            \ 'j<Plug>(gina-blame-echo)'
            \)
call gina#custom#mapping#nmap(
            \ 'blame', 'k',
            \ 'k<Plug>(gina-blame-echo)'
            \)
