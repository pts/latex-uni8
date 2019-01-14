#! /bin/bash --
# by pts@fazekas.hu at Mon Jan 14 14:50:05 CET 2019
set -ex

for F in example*.tex; do
  rm -f "${F%.*}.aux" "${F%.*}.log" "${F%.*}.pdf"
  DO_LUALATEX=1
  case "$F" in example_p*r.tex) DO_LUALATEX= ; esac
  WORKS_IN_PDFLATEX=1
  case "$F" in example_f*.tex) WORKS_IN_PDFLATEX= ; esac
  DO_MULTIRUN=
  case "$F" in example_*m*.tex) DO_MULTIRUN=1 ; esac
  if test "$DO_MULTIRUN"; then
    # Generate .aux file with labels.
    pdflatex --interaction=nonstopmode "$F" ||:
  fi
  if test "$WORKS_IN_PDFLATEX"; then  # Works in pdflatex.
    pdflatex --interaction=nonstopmode "$F"
    grep 'Warning: ' "${F%.*}".log && exit 1
  else
    if pdflatex --interaction=nonstopmode "$F"; then
      set +x
      echo "fatal: $F is expected to fail with pdflatex" >&2
      exit 1
    fi
  fi

  if test "$DO_LUALATEX"; then
    rm -f "${F%.*}.aux" "${F%.*}.log" "${F%.*}.pdf"
    if test "$DO_MULTIRUN"; then
      # Generate .aux file with labels.
      lualatex --interaction=nonstopmode "$F" ||:
    fi
    lualatex --interaction=nonstopmode "$F"
    grep 'Warning: ' "${F%.*}".log && exit 1
  fi
done

: test.sh OK.
