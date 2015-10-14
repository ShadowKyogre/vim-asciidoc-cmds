command! -buffer -nargs=0 TestRender w !asciidoc -b html -o /tmp/test.html - 
command! -buffer -nargs=0 TestRenderWName exe '!asciidoc -b html -o /tmp/' . shellescape(expand('%')) . ' ' . shellescape(expand('%'))
