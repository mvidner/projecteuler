%: %.hs
	ghc --make $@
%: %.lhs
	ghc --make $@

.PHONY: check
check:
	doctest -ilib pe????*hs

.PHONY: clean
clean:
	-rm -f *.hi *.o *.aux *.log *~
