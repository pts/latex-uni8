pts-latex-uni8: UTF-8 styles for pdflatex + lualatex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pts-latex-uni8 contains some LaTeX style (.sty) files which make UTF-8
input encoding, font encoding and font setup easy and consinstent between
modern pdflatex and lualatex.

How to use:

  \documentclass{article}
  \usepackage{uni8-hu}
  ...
  \begin{document}
  ...
  \end{document}

Limitations:

* uni8-hu.sty doesn't work with \usepackage{fontspec}. It may load fine, but
  some characters or hyphenation will be incorrect.

uni8-hu.sty takes care of the following:

* \usepackage[utf8]{inputenc} (or a variation of it).
* It makes sure that magyar.ldf doesn't print a warning about inputenc.sty.
* \usepackage{t1enc}
* \usepackage[english,hungarian]{babel}
* \usepackage{soul} (or a variation of it, if available).
* It makes the \ul command (as defined in soul.sty) should just work with
  footnotes and automatic hyphenation as well.

Usage recommendations and best practices:

* Use \usepackage{uni8-hu} with pdflatex it possible.
* \usepackage{uni8-hu} also works with lualatex (tested in TeX Live 2019),
  but for simplicity and increased backwards compatibility don't use lualatex
  unless you find something which something doesn't work with pdflatex.
* If you are using \usepackage{fontspec} with lualatex, uni8-hu.sty can't
  help you (yet), and we don't have recommendations for you (yet).

Features:

* Use \usepackage[font=times] to use Times, Helvetica and Courier as default
  text and math fonts (rather than Latin Modern, which is based on Computer
  Modern). This uses the new Tex Gyre text fonts.
* Use \usepackage[font=old-times] to use Times, Helvetica and Courier as
  text and math default fonts (rather than Latin Modern, which is based on
  Computer Modern). This uses the new old URW-based text fonts with
  times.sty.
* Use \usepackage[inputenc=latin2] to use ISO-8859-2 input encoding. Most
  users shouldn't need this nowaday, the UTF-8 default is better.
* Use \usepackage[inputenc=latin1] to use ISO-8859-1 input encoding. Most
  users shouldn't need this nowaday, the UTF-8 default is better.

__END__
