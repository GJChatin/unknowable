# A simple Makefile to build a LISP interpreter
.PHONY: all \
	clean \
	run-fixedpoint \
	run-godel \
	run-sets

ALL=lisp lisp.class

#: Build everything
all: $(ALL)

#: Build C LISP interpreter
lisp: lisp.c
	cc -O -olisp lisp.c

#: Build Java LISP interpreter
lisp.class: lisp.java
	javac lisp.java

#: Run fixedpoint LISP example through the LISP interpreter
run-fixedpoint: lisp fixedpoint.l
	./lisp < fixedpoint.l

#: Run godel LISP example through the LISP interpreter
run-godel: lisp godel.l
	./lisp < godel.l

#: Run godel LISP example through the LISP interpreter
run-sets: lisp sets.l
	./lisp < sets.l

#: Clean programs
clean:
	@rm $(ALL) 2>/dev/null || true
