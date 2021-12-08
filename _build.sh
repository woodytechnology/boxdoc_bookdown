#!/bin/sh

set -ev

if [ "$NO_WOODY" = "1" ]
then
   cp _output_nowoody.yml _output.yml
else
   cp _output_woody.yml _output.yml
fi
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook' )"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::word_document2')"

rm _output.yml