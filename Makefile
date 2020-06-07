# BASE:=book
# BOOKNAME:=$(shell ls -1 $(BASE) | head -n 1)
# SRC:=book/$(BOOKNAME)

all:
	cat README.md

# include resources/makefiles/setup.Makefile


clean:
	rm -rf duckuments-dist

build:
	docker run -it  -v $(PWD):/pwd --workdir /pwd duckietown/docs-build:daffy hello