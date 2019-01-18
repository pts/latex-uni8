latex-uni8: Universal inputenc, fontenc and babel for pdflatex + lualatex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
uni8.sty is a LaTeX style file which makes it easy to use input encoding
(UTF-8 by default, can be changed), fontspec.sty (optional), font
encoding (T1 if fontspec.sty is not used), babel (English language by
default), hyphenation, underline (with soul.sty), default text and math
fonts (Computer Modern or Times) and paper sizes correctly with both
pdflatex and lualatex.

How to use:

  \documentclass{article}
  \usepackage{uni8}
  ...
  \begin{document}
  ...
  \end{document}

See the project page https://github.com/pts/latex-uni8 for example files
and the latest updates.

The name uni8 is an abbreviation of: universal UTF-8 and 8-bit input
encoding. It indicates that uni8.sty can set up UTF-8 (utf8) and legacy
8-bit input encodings (e.g. latin1, latin2) correctly in many environments
(pdflatex or lualatex, with or without fontspec.sty, T1 or Unicode font
encoding).

Limitations:

* \showhyphens doesn't display accented characters correctly in the console
  log. With pdflatex on an UTF-8 console all non-ASCII characters are wrong.
  With lualatex on an UTF-8 console with T1 font encoding some non-ASCII
  characters (e.g. ő and ű) are wrong: the ones which are at a different
  location in Unicode and T1 encoding.

uni8.sty takes care of the following:

* It sets up font families (text: main, sans and mono; also math): Computer
  Modern (implemented using Latin Modern) by default, and it's possible to
  select Times + Helvetica + Courier (implemented using TeX Gyre and mathptmx)
  instead.
* It sets up input encoding (UTF-8 is the default, it does
  \usepackage[utf8]{inputenc} or a variation of that).
* It sets the page size based on \documentclass[a4paper]{article} etc.
* \usepackage[english]{babel} (this includes setting up hyphenation).
  If you want a different language, then do someting like
  \PassOptionsToPackage{hungarian}{babel} before \usepackage{uni8}.
* \usepackage{soul} (or a variation of it, if available).
* It makes the \ul command (as defined in soul.sty) should just work with
  footnotes and automatic hyphenation as well.
* It makes \hyphenation{...} exceptions work properly, even with accented
  characters specified the usual way (encoded with the input encoding, UTF-8
  by default). (For lualatex, it also makes \patterns{...} work similarly.)
* It makes sure that magyar.ldf (if \PassOptionsToPackage{hungarian}{babel}
  is used) doesn't print useless warnings about inputenc.sty or t1enc.sty.
* It sets up font encoding (like T1 encoding with \usepackage{t1enc} if
  needed).

Usage recommendations and best practices:

* Use \usepackage{uni8} with pdflatex (rather than lualatex) if possible,
  because pdflatex is faster.
* If you need lualatex, probably you want to use Unicode fonts, so use
  \usepackage[fontspec]{uni8}. Configure fonts with \fontspec{...} and
  \setmainfont{...} as usual. The default font for uni8 is Computer Modern
  (Latin Modern).
* \usepackage{uni8} also works with lualatex without fontspec.sty
  (tested on TeX Live 2019), but for simplicity and increased backwards
  compatibility (especially for magyar.ldf), use pdflatex instead of
  lualatex-without-fontspec.sty if possible. The most fragile part of how
  uni8.sty uses lualatex without fontspec.sty is setting up hyphenation
  patterns with the T1 encoding.

Features:

* The default font (\usepackage[font=cm]) families are Computer Modern
  (implemented using Latin Modern) by default.
* Use \usepackage[font=times] to use Times, Helvetica and Courier font
  families (implemented using TeX Gyre and mathptmx).
* Use \usepackage[font=old-times] to use Times, Helvetica and Courier as
  text and math default fonts (rather than Latin Modern, which is based on
  Computer Modern). This uses the new old URW-based text fonts with
  times.sty.
* Use \usepackage[inputenc=latin2] to use ISO-8859-2 input encoding. Most
  users shouldn't need this nowaday, the UTF-8 default is better.
* Use \usepackage[inputenc=latin1] to use ISO-8859-1 input encoding. Most
  users shouldn't need this nowaday, the UTF-8 default is better.
* uni8.sty is compatible with hyperref.sty, color.sty and xcolor.sty in both
  pdflatex and lualatex.
* uni8.sty works with pdflatex, lualatex and latex (with .dvi
  output).

How to install LaTeX on Debian Buster, with TeX Live 2019:

* To get the pdflatex command, run:
  sudo apt-get install texlive-latex-base
* To get the lualatex command (and the minimal defaults for uni8.sty), run:
  sudo apt-get install texlive-latex-base texlive-luatex
* To make [fontspec] (eqivalent to \usepackage{fontspec}) work, run:
  sudo apt-get install texlive-latex-base texlive-luatex texlive-latex-recommended
* To make [font=times] work without [fontspec], run:
  sudo apt-get install texlive-latex-base texlive-latex-recommended tex-gyre
* To make [font=times] work with [fontspec], run:
  sudo apt-get install texlive-latex-base texlive-luatex fonts-texgyre texlive-latex-recommended
* To make \usepackage{soul} (automatically done by uni8.sty) work, run:
  sudo apt-get install texlive-latex-base texlive-latex-extra
* To make \usepackage{lmodern} (automatically done by uni8.sty) work, run:
  sudo apt-get install texlive-latex-base
* To make \PassOptionsToPackage{english,american,british}{babel} (and the
  corresponding hyphenation) work, run:
  sudo apt-get install texlive-latex-base
* To make \PassOptionsToPackage{german}{babel} work, run:
  sudo apt-get install texlive-latex-base texlive-lang-german
* To make \PassOptionsToPackage{spanish}{babel} work, run:
  sudo apt-get install texlive-latex-base texlive-lang-spanish
* To make \PassOptionsToPackage{french}{babel} work, run:
  sudo apt-get install texlive-latex-base texlive-lang-french
* To make \PassOptionsToPackage{italian}{babel} work, run:
  sudo apt-get install texlive-latex-base texlive-lang-italian
* To make \PassOptionsToPackage{hungarian}{babel} (and the corresponding
  hyphenation) work, run:
  sudo apt-get install texlive-latex-base texlive-lang-european

Compatibility with TeX Live:

* FYI The hyphen-hungarian and babel-hungarian TeX Live packages are not
  needed by uni8.sty, but it is needed by example_*.tex.
* TeX Live 2004 and earlier: It wasn't tried.
* TeX Live 2005--2009: pdflatex works after this:
  $ tlmgr install scheme-basic lm hyphen-hungarian babel-hungarian
  lualatex wasn't tried, it may work.
* Tex Live 2010--2014: Both pdflatex and lualatex work after this:
  $ tlmgr install scheme-basic luainputenc luatexbase lm hyphen-hungarian babel-hungarian
  Only lualatex needs luainputenc and luatexbase.
* Tex Live 2015--2019: Both pdflatex and lualatex work after this:
  $ tlmgr install scheme-basic luainputenc luatexbase lm ctablestack hyphen-hungarian babel-hungarian
  Only lualatex needs luainputenc, luatexbase and ctablestack.

Compatibility with teTeX:

* teTeX 0.x: It wasn't tried.
* teteX 1--2: It doesn't have \usepackage[utf8]{inputenc}, but the
  non-Unicode source files (e.g. example_pl.tex) work with pdflatex.
  lualatex wasn't tried, probably it doesn't work.
  In teTeX 1, Hungarian hyphenation patterns have to be enabled first
  by regenerating the format file.
* teTeX 3: pdflatex works if the lmodern (Latin Modern) fonts are installed.
  lualatex wasn't tried, probably it doesn't work.

Old TeX Live download links:

* TeX Live 2005:
  ftp://ftp.tug.org/texlive/historic/2005/texlive2005-inst-20051102.iso.bz2
  http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2005/texlive2005-inst-20051102.iso.bz2
* TeX Live 2006: There was no such release.
* TeX Live 2007:
  ftp://ftp.tug.org/texlive/historic/2007/texlive2007-live-20070212.iso.bz2
  http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2007/texlive2007-live-20070212.iso.bz2

__END__
