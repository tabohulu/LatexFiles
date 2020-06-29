@echo off
::    name and equation body

::go to the working directory specified by the first argument
cd %1

set name="latex%2"


::   create .tex file

if "%4" == "r" (
  call :routput %3
) else (
  call :output %3
)






::compile and create .pdf file
::pdflatex -interaction nonstopmode t.tex
latex -interaction nonstopmode t.tex
dvipdfmx t.dvi
pdfcrop t.pdf tmp1.pdf
::ps2pdf14 "-dAutoRotatePages=/None" tmp1.pdf %name%.pdf
ps2pdf14 -dAutoRotatePages#/None tmp1.pdf %name%.pdf


::clean up
::rm -f $name.log $name.aux $name.tex




::sub routines to work aound the problem when writing "( )"

:output
 echo \documentclass[12pt]{article}\usepackage{amssymb,amsmath}\pagestyle{empty}\renewcommand{\rmdefault}{phv} \renewcommand{\sfdefault}{ptm} \renewcommand{\ttdefault}{pcr} \begin{document} $%~1$ \end{document} > t.tex
 goto :end


:routput
 echo \documentclass[12pt]{article}\usepackage{amssymb,amsmath,rotating}\pagestyle{empty}\renewcommand{\rmdefault}{phv} \renewcommand{\sfdefault}{ptm} \renewcommand{\ttdefault}{pcr} \begin{document} \begin{sideways}$%~1$ \end{sideways} \end{document} > t.tex
 
:end


