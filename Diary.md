### 2015-04-13, Monday

#### For positive numbers, use `quotRem`.

In class `Integral`, `div` and `mod` (where `div` truncates toward -infinity)
are slower than `quot` and `rem` (where `quot` truncates toward 0)
because `divMod` is implemented with `quotRem` and `signum`.

http://hackage.haskell.org/package/base-4.8.0.0/docs/src/GHC-Real.html#line-154

But I should actually measure whether it makes a significant difference.

#### Emacs mode

M-x customize-variable package-archives,
add ("melpa" . "http://melpa.org/packages/")

M-x package-refresh-contents
M-x package-install haskell-mode

#### Folding an infite list

Unsuccessfully tried to fold an infinite list. Wanted to write an inverse to
the `Prelude.cycle` function. Ended up with a non-fold. See `PE0026.uncycle`.

#### Improved #3, started Benchmark

Started giving the problems an interface for benchmarking the alternate
implementations.

### 2015-04-14, Tuesday

#### Doctest acts weird

In some circumstances (which?), doctest will fail like

    ### Failure in src/PE0014.hs:10: expression `collatzChain 3'
    expected: [3,10,5,16,8,4,2,1]
     but got:
              <interactive>:74:1: Not in scope: `collatzChain'

This can be fixed by making sure that the *.hs file is preferred to the *.o
file by touching the former or removing the latter. WTF.

#### One executable per problem is a pain

Will need to refactor that to have a single runner.

#### Used a strict fold to avoid overflowing the stack

In #27.

### 2015-04-15, Wednesday

#### The first Hspec test

A trivial test is easy but it feels stupid to separate the test from the
documentation. Doctest would be much neater. Hopefully the single runner will
help.
