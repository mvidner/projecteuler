%: %.hs
	ghc --make $@
%: %.lhs
	ghc --make $@

.PHONY: check
check:
	cd src; doctest *hs

.PHONY: clean
clean:
	-cd src; rm -f *.hi *.o *.aux *.log *~
