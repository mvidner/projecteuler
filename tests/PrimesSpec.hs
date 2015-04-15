module Main where

import Test.Hspec

import Primes

main :: IO ()
main = hspec $ do
    let tenPrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

    describe "Primes.unfaithfulSievePrimes" $ do
        it "computes the first 10 primes" $ do
            take 10 unfaithfulSievePrimes `shouldBe` tenPrimes

    describe "Primes.trialDivisionPrimes" $ do
        it "computes the first 10 primes" $ do
            take 10 trialDivisionPrimes `shouldBe` tenPrimes

    describe "Primes.isPrime" $ do
        context "when the inputs are positive" $ do
            it "works on small numbers" $ do
                mapM_ (\(i, result) ->
                        ((i, isPrime i) `shouldBe` (i, result))) [
                    (1 , False), (2,  True),  (3,  True), (4, False),
                    (5 , True),  (6,  False), (7,  True), (8, False),
                    (9,  False), (10, False), (11, True), (12, False),
                    (13, True),  (14, False), (15, False)
                    ]
        context "when the inputs are not positive" $ do
            it "works on small numbers" $ do
                mapM_ (\(i, result) ->
                        ((i, isPrime i) `shouldBe` (i, result))) [
                    (0,    False), ((-1), False), ((-2), False),
                    ((-3), False), ((-4), False), ((-5), False)
                    ]
