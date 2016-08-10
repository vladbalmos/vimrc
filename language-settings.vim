augroup PHPSettings
    autocmd!
    autocmd BufWritePost *.php Neomake
augroup END

" Javascript
augroup JSLangSettings
    autocmd!
    autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
    autocmd BufWritePost *.js Neomake
augroup END

augroup RubySettings
    autocmd!
    autocmd BufWritePost *.rb Neomake
augroup END

