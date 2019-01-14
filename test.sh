#! /bin/bash --
# by pts@fazekas.hu at Mon Jan 14 14:50:05 CET 2019
set -ex

for F in example*.tex; do
  rm -f "${F%.*}.aux"
  if test "$F" = example_pm.tex; then
    # Generate .aux file with labels.
    pdflatex --interaction=nonstopmode "$F" ||:
  fi
  if test "${F#example_f}" = "$F"; then  # Works in pdflatex.
    pdflatex --interaction=nonstopmode "$F"
    grep 'Warning: ' "${F%.*}".log && exit 1
  else
    if pdflatex --interaction=nonstopmode "$F"; then
      set +x
      echo "fatal: $F is expected to fail with pdflatex" >&2
      exit 1
    fi
  fi

  rm -f "${F%.*}.aux"
  if test "$F" = example_pm.tex; then
    # Generate .aux file with labels.
    lualatex --interaction=nonstopmode "$F" ||:
  fi
  lualatex --interaction=nonstopmode "$F"
  grep 'Warning: ' "${F%.*}".log && exit 1
done

: test.sh OK.
