#!/bin/sh

lualatex --synctex=1 ./tlinstall.tex
biber ./tlinstall
lualatex --synctex=1 ./tlinstall.tex
