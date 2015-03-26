%: %.hs
	ghc --make $@
%: %.lhs
	ghc --make $@

.PHONY: clean
clean:
	-rm -f *.hi *.o *.aux *.log *~
