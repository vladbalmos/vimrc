command! VBVimuxRunCommand :call VBVimuxRunCommand()
command! VBVimuxCommandPrompt :call VBVimuxCommandPrompt()

function! VBVimuxCommandPrompt()
    call inputsave()
    if !exists('g:vb_vimux_command')
        let s:default_command = ''
    else
        let s:default_command = g:vb_vimux_command
    endif
    let g:vb_vimux_command = input('VimuxCommand: ', s:default_command, 'file')
    call inputrestore()
endfunction

function! VBVimuxIsCurrentBufferExecutable()
    let l:is_executable = executable(expand('%'))
    if (l:is_executable)
        return expand('%')
    endif
    return ''
endfunction!

function! VBVimuxRunCommand()
    if !exists('g:vb_vimux_command')
        let s:current_file_is_command = VBVimuxIsCurrentBufferExecutable()
        if strlen(s:current_file_is_command)
            call VimuxRunCommand(s:current_file_is_command)
            return
        else
            call VBVimuxCommandPrompt()
        endif
    endif
    call VimuxRunCommand(g:vb_vimux_command)
endfunction
