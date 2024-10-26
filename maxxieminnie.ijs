NB. SPDX-FileCopyrightText: 2024 Justus Perlwitz
NB. SPDX-License-Identifier: CC0-1.0
0 : 0
https://ericnormand.me/issues/468

Maxie and Minnie

The maxxie of a number n is the largest number you can achieve by swapping two of its digits (in decimal) (or choosing not to swap if it is already the largest possible). The minnie is the smallest with one swap (though you can't swap a zero digit into the most significant position).

Your task is to write a function that takes an integer and returns a tuple of the maxxie and minnie.

Examples

(swapmaxmin 213) ;=> [312, 123]
(swapmaxmin 12345) ;=> [52341, 12345] ;; the number was already the
smallest
(swapmaxmin 100) ;=> [100, 100] ;; no swap possible because of
zeroes
)

NB. we define a verb that allows us to swap two digits in a number
NB. numbers are indexed from the right
NB. usage:
NB. 123 sd 0 1 => 132
NB. 123 sd 0 2 => 321
NB. 12345 sd 2 4 => 32145
digits =: 10&#.^:_1
sd =: {{
  NB. 1. Use &.: Under conjunction to get digits of x, then recompose later
  NB. 2. Swap swaps the two digits in y
  NB. 3. Amend uses m} Amend to create a copy of x with the digits in y swapped
  amend =. (|.y)}
  swap =. (y { ]) amend ]
  swap &.: digits x
}}

3 : 0''
  assert. 132 = 123 sd 1 2
  assert. 321 = 123 sd 0 2
  assert. 12543 = 12345 sd 2 4
)

NB. get cartesian product of set of N numbers, filter by unique and l/r not-equal
0 : 0
example
   cart i. 5
0 1
0 2
0 3
0 4
1 2
1 3
1 4
2 3
2 4
3 4
)
cart =: {{
  NB. generate and concatenate
  all =. ,/ (,"0)/~ y
  uniq =. ~. /:~"1 all
  NB. get left and right side of permutations
  l =. 0{"1 uniq
  r =. 1{"1 uniq
  NB. is equal?
  (l ~: r) # uniq
}}

swapmaxmin =: {{
  NB. 1. get number of digits in y
  NB. 2. generate i. ndigits combinations
  NB. 3. generate all possible swaps by applying sd to y over all combinations
  NB. 4. Remove results where number of digits has decreased
  NB. 5. Return largest and smallest
  ndigits =. [: # digits
  combs =. cart i. ndigits y
  constr =. ((ndigits y) <: [: ndigits"0 ]) # ]
  swaps =. constr y, y sd"1 combs
  (>./ , <./) swaps
}}
3 : 0''
  assert. (312,123) = swapmaxmin 213
  assert. (52341,12345) = swapmaxmin 12345
  assert. (100,100) = swapmaxmin 100
)