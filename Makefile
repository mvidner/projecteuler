.PHONY: all
all:
	cabal build

.PHONY: check
check:
	cabal test

.PHONY: clean
clean:
	-cd src; rm -f pe???? *.hi *.o *.aux *.log *~
	rm -rf dist

.PHONY: doc
doc:
	cabal haddock
