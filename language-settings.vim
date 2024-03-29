" Javascript
augroup JSLangSettings
    autocmd!
    autocmd Filetype javascript setlocal ts=4 sw=4 sts=0
augroup END

" Python
augroup PythonLangSettings
    autocmd!
    autocmd Filetype python setlocal ts=4 sw=4 sts=4 tw=79 fileformat=unix
augroup END

" Golang
augroup GoLangSettings
    autocmd!
    autocmd BufWritePost *.go silent exec "!gofmt %" | exec ":redraw!"
augroup END
