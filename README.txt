pts-latex-uni8: UTF-8 styles for pdflatex + lualatex
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pts-latex-uni8 contains some LaTeX style (.sty) files which make UTF-8
input encoding, font encoding and font setup easy and consinstent between
modern pdflatex and lualatex.

Use case:

* Load a single package which works with both pdflatex and lualatex.
* The package should work with and without fontspec in lualatex.
* Automatic hyphenation should be correct with or without fontspec.
* Allow at least two font sets to be selected for both text and math:
  Computer Modern and Times.
* The \ul command (as defined in soul.sty) should just work with footnotes
  and automatic hyphenation as well.

__END__
