#!/bin/bash

rm -rf build/*
mkdir -p build
echo "First run of pdflatex..."
pdflatex -interaction=batchmode --output-directory=build main
cp *.bib build/.
cp *.bst build/.
cd build/
echo "Running bibtex..."
bibtex main
cd ..
echo "Second run of pdflatex..."
pdflatex -interaction=batchmode --output-directory=build main
echo "Third run of lulatex..."
pdflatex -interaction=batchmode --output-directory=build main
echo "Running gs to embed fonts..."
gs -dNOPAUSE -dBATCH -dEmbedAllFonts=true -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -o build/main_fontsEmbeded.pdf build/main.pdf >& build/logGS
cp build/main_fontsEmbeded.pdf LArIAT_PionAbsChEx_TechNote.pdf
