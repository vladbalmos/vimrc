" Toggle relative numbers on or off
function! ToggleRelativeNumbers()
    if &relativenumber
        set relativenumber!
    else
        set relativenumber
    endif
endfunction
nnoremap <leader><C-r> :call ToggleRelativeNumbers()<CR>

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

" Run phpunit test usign gearman server & worker
function! RunPHPUnitTest()
python << EOF
import vim, os, shutil, json, subprocess
import traceback

current_buffer = vim.current.buffer
filename = current_buffer.name

tests_dir = os.path.join(os.getcwd(), vim.vars['tests_path'])
test_arguments = { 
    "dir": tests_dir,
    "test": None
}

def parse_and_try2run_test(lines):
    """ 
    Parse lines for "//[[test=filename]]" pattern and call gearman to run the tests
    """
    pattern_prefix = "//[[test="
    for line in lines:
        if not pattern_prefix in line:
            continue

        if line.find(pattern_prefix) != 0:
            continue

        test_path = line[len(pattern_prefix) : -2] 
        run_test(test_path)

def make_test_file(filename):
    """ 
    Get test filepath relative to the tests directory
    """

    file_dirname = os.path.dirname(filename)
    file_dirname = file_dirname.replace(os.getcwd(), "") 
    file_dirname_segments = file_dirname.split(os.path.sep)
    file_dirname = os.path.sep.join(file_dirname_segments[2:])

    test_file = os.path.join(file_dirname, os.path.basename(filename))
    return test_file

def run_test(filename):
    test_arguments['test'] = filename
    test_arguments_json = json.dumps(test_arguments)
    subprocess.call(['gearman', '-s', '-b', '-f', 'runtest', test_arguments_json])

if os.path.isfile(filename):
    if filename.endswith("Test.php"):
        test_file = make_test_file(filename)
        run_test(test_file)
    else:
        try:
            lines = current_buffer[1:50]
        except IndexError:
            lines = None

        if lines is not None:
            parse_and_try2run_test(lines)
EOF
endfunction

function! PHPMethodsGen()
python << EOF
import vim
import traceback

def parse_property_template(text):
    segments = text.split(':')
    if len(segments) < 3:
        return None

    visibility = segments[0]
    data_type = segments[1]
    property_name = segments[2]

    php_property = "%s $%s;\n" % (visibility, property_name)
    php_property_doc = '''
/**
 * @var %s
 */
'''
    php_property_doc = php_property_doc % data_type

    php_property = php_property_doc + php_property
    orig_property_name = property_name

    if len(segments) > 3:
        php_method_suffix = segments[3]
    else:
        if property_name[0] == '_':
            property_name = property_name[1:]
        php_method_suffix = property_name[:1].upper() + property_name[1:]

    php_setter = '''
/**
 * @param %s $%s
 */
public function %s($%s) 
{
    $this->%s = $%s;
}
'''

    php_param_name = php_method_suffix[:1].lower() + php_method_suffix[1:]
    php_setter_name = 'set%s' % php_method_suffix
    php_setter = php_setter % (data_type, php_param_name, php_setter_name, php_param_name, orig_property_name, php_param_name)

    php_getter = '''
/**
 * @return %s
 */
public function %s()
{
    return $this->%s;
}
'''
    php_getter_name = 'get%s' % php_method_suffix
    php_getter = php_getter % (data_type, php_getter_name, orig_property_name)

    return (php_property, php_setter, php_getter)

def generate_methods(text):
    lines = text.splitlines()
    result = []

    for line in lines:
        line = line.strip()
        if not len(line):
            continue
        
        components = parse_property_template(line)
        if components is None:
            continue;

        result.append(components)

    return result

def insert_code(component):
    buffer = vim.current.buffer
    current_range = vim.current.range

    property_name, setter, getter = component
    
    index = current_range.start
    buffer[index] = None

    property_name_lines = property_name.splitlines()
    setter_lines = setter.splitlines()
    getter_lines = getter.splitlines()

    for line in property_name_lines:
        buffer.append(line, index)
        index += 1

    for line in setter_lines:
        buffer.append(line, index)
        index += 1

    for line in getter_lines:
        buffer.append(line, index)
        index += 1

    vim.current.window.cursor = (index, 0)
        
buffer = vim.current.buffer
code_components = generate_methods(buffer[vim.current.range.start])
if len(code_components):
    component = code_components.pop()
    insert_code(component)

EOF
endfunction 
