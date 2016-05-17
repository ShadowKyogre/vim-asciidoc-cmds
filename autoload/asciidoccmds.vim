function! asciidoccmds#ToOdtHtml()
	let tmpname = shellescape(tempname())
	let origname = shellescape(expand('%:p'))
	let htmlname = shellescape('/tmp/' . substitute(expand('%:t'), '\.adoc$', '.html', ""))
	silent exe '!a2x -f xhtml -D /tmp -r ~/.asciidoc --stylesheet="docbook-xsl.css custom_tweaks.css lo_office_phys_indent.css" ' . origname
	silent exe '!env ADOC_HTML_INLINE=1 asciidoc-postfilter.py ' . htmlname  . ' > ' . tmpname
	silent exe '!cp -vf ' .  tmpname . ' ' . htmlname
	silent exe '!inline-html.py ' . htmlname  . ' > ' . tmpname
	silent exe '!cp -vf ' .  tmpname . ' ' . htmlname
endfunction
