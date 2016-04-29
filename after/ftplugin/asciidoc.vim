command! -buffer -complete=file -nargs=0 ToOdtHtml call asciidoccmds#ToOdtHtml()
command! -buffer -nargs=0 TestRender w !asciidoc -b html -o /tmp/test.html - 
command! -buffer -nargs=0 TestRenderWName exe '!asciidoc -b html -o /tmp/' . shellescape(expand('%')) . ' ' . shellescape(expand('%'))
command! -buffer -nargs=0 ToEpub exe '!a2x -L -r ~/.asciidoc/'
	\ . ' --stylesheet="docbook-xsl.css custom_tweaks.css"'
	\ . ' --xsl-file ~/.vim/bundle/asciidoc-annos/remove_invalid_references.xsl'
	\ . ' -vv -f epub -D /tmp ' . shellescape(expand('%'))
