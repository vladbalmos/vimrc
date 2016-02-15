command! VBVimuxRunCommand :call VBVimuxRunCommand()
command! VBVimuxCommandPrompt :call VBVimuxCommandPrompt()

function! VBVimuxCommandPrompt()
    let g:vb_vimux_command = input('VimuxCommand: ', '', 'file')
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

" On save, copy file to another location
function! VBSyncFile()
python << EOF
import vim, os, sys, shutil
import traceback
from ConfigParser import SafeConfigParser

filename = vim.current.buffer.name

def get_config():
    # read list of parent directories for syncing
    user_homepath = os.path.expanduser('~')
    config_file = '.vimdirs.2sync.ini'
    config_filepath = os.path.join(user_homepath, config_file)

    conf = SafeConfigParser()
    try:
        conf.readfp(open(config_filepath))
        return conf
    except Exception, e:
        print traceback.format_exc()
        return None

if os.path.isfile(filename):
    config = get_config()

    if config is not None:
        dirname = os.path.dirname(filename)

        defined_source = config.get('main', 'source')
        defined_target = config.get('main', 'target')

        if defined_source in filename:
            relative_path = filename.replace(defined_source, '')
            source = filename
            target = os.path.join(defined_target, relative_path)

            target_dir = os.path.dirname(target)

            if os.path.isdir(target_dir) is False:
                os.makedirs(target_dir)

            shutil.copy2(source, target)
    else:
        print "Config file not present for sync operations"

EOF
endfunction
