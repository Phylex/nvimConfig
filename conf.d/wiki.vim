" Configure vimwiki to create a wiki at ~/wiki with the html in /wiki/html
let wiki = {}
let wiki.path = '~/cern/wiki'
let wiki.public_html = '~/cern/wiki/html'
let wiki.auto_export = 1
let wiki.auto_toc = 1
let wiki.index = 'index'
let wiki.diary_rel_path = '/Logbook'
let wiki.diary_index = 'Logbook'
let wiki.diary_header = 'Logbook'
let wiki.nested_syntaxes = {'python': 'python', 'c': 'c', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

