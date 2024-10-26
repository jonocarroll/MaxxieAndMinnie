swap <- function(x, y, v) {
  xx <- v[x]
  yy <- v[y]
  v[x] <- yy
  v[y] <- xx
  v
}

swap(2, 5, 1:6)
swap(2, 5, LETTERS[1:6])

chr_swap <- function(x, y, v) {
  paste0(swap(x, y, v), collapse = "")
}

chr_swap(2, 5, LETTERS[1:6])

toInt_swap <- function(x, y, v) {
  as.integer(chr_swap(x, y, v))
}

toInt_swap(2, 5, 1:6)

maxmin <- function(num) {
  chars <- strsplit(as.character(num), "")[[1]]
  n <- nchar(num)
  s <- seq_len(n)
  opts <- expand.grid(x = s, y = s)
  opts$v <- list(chars)
  vals <- purrr::pmap_int(opts, toInt_swap)
  vals <- vals[nchar(vals) == n]
  c(max(vals), min(vals))
}

maxmin(213) == c(312, 123)
maxmin(12345) == c(52341, 12345) # the number was already the smallest
maxmin(100) == c(100, 100) # no swap possible because of zeroes
maxmin(11321) == c(31121, 11123)

### apl

# s←{⌽@⍺⊢⍵}
# ⎕IO←1
# opts← ,(⍳3) ∘., ⍳3
# s←{⎕IO←1⋄⌽@⍺⊢⍵}
# 2 1 3 s 1 3
# swaps←{2 1 3 s ⍵}
# swaps ¨ opts
# (⌈/,⌊/)10⊥¨swaps ¨ opts

# maxmin←{
# ⎕IO←1 
# s←{⌽@⍵⊢⍺}
# n←⍎¨⍕⍵
# opts←,(⍳≢n)∘.,⍳≢n
# swaps←{n s ⍵}
# new←swaps¨opts
# keep←(~0=⊃¨new)/new
# nums←10⊥¨keep
# (⌈/,⌊/)nums
# }

# maxmin←{
#   ⎕IO←1  ⍝ so that x[1] is subset
#   n←⍎¨⍕⍵  ⍝ convert int to vec 
#   s←{⌽@⍵⊢⍺}  ⍝ swap two elements
#   swaps←{n s ⍵}  ⍝ apply swaps to a vec n
#   opts←,(⍳≢n)∘.,⍳≢n ⍝ combinations of 1..n
#   new←swaps¨opts  ⍝ perform the swaps
#   keep←(~0=⊃¨new)/new  ⍝ filter out values starting with 0
#   (⌈/,⌊/)10⊥¨keep  ⍝ max and min of ints
# }

#      maxmin 213 
# 312 123
#      maxmin 12345 
# 52341 12345
#      maxmin 100 
# 100 100
#      maxmin 11321
# 31121 11123
