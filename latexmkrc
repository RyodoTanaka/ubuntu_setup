$latex = $latex='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$bibtex = 'jbibtex';
$dvipdf = $dvipdf='dvipdfmx -f ptex-ipaex.map %S';
$dvips = 'pdvips';
$dvi_previewer = 'start xdvi';
$pdf_previewer = 'start evince';
$pdf_mode = 3;
