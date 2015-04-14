%: %.hs
	ghc --make $@
%: %.lhs
	ghc --make $@

.PHONY: check
check:
	doctest src/[[:upper:]]*hs

.PHONY: clean
clean:
	-cd src; rm -f *.hi *.o *.aux *.log *~
