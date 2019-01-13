pts-latex-uni8: Universal inputenc, fontend and babel for pdflatex + lualatex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pts-latex-uni8 contains some LaTeX style (.sty) files which make it easy to
use input encoding (UTF-8 by default), font encoding (T1), babel (English
language by default), hyphenation, underline (with soul.sty) and default
text and math fonts (Computer Modern or Times) correctly with both pdflatex
and lualatex.

How to use:

  \documentclass{article}
  \usepackage{uni8}
  ...
  \begin{document}
  ...
  \end{document}

Limitations:

* uni8.sty doesn't work with \usepackage{fontspec}. It may load fine, but
  some characters or hyphenation will be incorrect.
* \showhyphens doesn't display accented characters correctly in the console
  log. With pdflatex on an UTF-8 console all non-ASCII characters are wrong.
  With lualatex on an UTF-8 console some non-ASCII characters (e.g. ő and ű)
  are wrong: the ones which are at a different location in Unicode and T1
  encoding.

uni8.sty takes care of the following:

* \usepackage[utf8]{inputenc} (or a variation of it).
* It makes sure that magyar.ldf (if \PassOptionsToPackage{hungarian}{babel}
  is used) doesn't print a warning about inputenc.sty.
* Setting up T1 font encoding (like \usepackage{t1enc}).
* \usepackage[english]{babel} (this includes setting up hyphenation).
  If you want a different language, then do someting like
  \PassOptionsToPackage{hungarian}{babel} before \usepackage{uni8}.
* \usepackage{soul} (or a variation of it, if available).
* It makes the \ul command (as defined in soul.sty) should just work with
  footnotes and automatic hyphenation as well.

Usage recommendations and best practices:

* Use \usepackage{uni8} with pdflatex it possible.
* \usepackage{uni8} also works with lualatex (tested in TeX Live 2019),
  but for simplicity and increased backwards compatibility don't use lualatex
  unless you find something which something doesn't work with pdflatex. The
  most fragile part of how uni8.sty uses lualatex is setting up hyphenation
  patterns with the T1 encoding.
* If you are using \usepackage{fontspec} with lualatex, uni8.sty can't
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
