# Maxxie and Minnie

https://ericnormand.me/issues/468

> The maxxie of a number n is the largest number you can achieve by swapping two
of its digits (in decimal) (or choosing not to swap if it is already the largest
possible). The minnie is the smallest with one swap (though you can't swap a
zero digit into the most significant position).
> 
> Your task is to write a function that takes an integer and returns a tuple of
the maxxie and minnie.
> 
> Notes
> 
> - Swap any two decimal digits
> - No leading zeroes
> - Don't swap if you can't make it bigger/smaller

Example solutions are given in Clojure 

```clojure
(swapmaxmin 213) ;=> [312, 123]
(swapmaxmin 12345) ;=> [52341, 12345] ;; the number was already the smallest
(swapmaxmin 100) ;=> [100, 100] ;; no swap possible because of zeroes
```

## Solutions

This repository contains solutions by me [@jonocarroll](https://github.com/jonocarroll) 
in:

- R
- Dyalog APL
- Julia
- Python
- Haskell
- Rust

as well as contributed solutions

- J ([@justuswilhelm](https://github.com/justuswilhelm))

If you have a solution you would like to include, please add an 
[Issue](https://github.com/jonocarroll/MaxxieAndMinnie/issues/new/choose) or 
[Pull Request](https://github.com/jonocarroll/MaxxieAndMinnie/compare).
