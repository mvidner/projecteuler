# make all needs this but then make check fails ?!
GHCFLAGS=-isrc
%: %.hs
	ghc --make $(GHCFLAGS) $@
%: %.lhs
	ghc --make $(GHCFLAGS) $@

.SECONDARY:
src/pe%.hs: src/PE%.*hs
	N=$*   ;\
	: > $@ ;\
	echo "module Main where"      >> $@ ;\
	echo "import qualified PE$$N" >> $@ ;\
	echo "main = PE$$N.main"      >> $@

MAKE_N = $(MAKE) --no-print-directory
.PHONY: all
all:
	for i in `seq -w 0001 26`; do $(MAKE_N) src/pe$$i; done

.PHONY: check
check:
	-rm     src/[[:upper:]]*.o # Really. Otherwise doctest wont find funcs
	doctest src/[[:upper:]]*hs

.PHONY: clean
clean:
	-cd src; rm -f pe???? *.hi *.o *.aux *.log *~
