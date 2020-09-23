all: clean gitbook
.PHONY: clean gitbook pdf

clean:
	Rscript -e 'options(bookdown.clean_book = TRUE); bookdown::clean_book()'

gitbook:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")'

pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::tufte_book2")'
