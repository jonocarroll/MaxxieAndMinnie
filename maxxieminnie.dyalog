maxmin←{
  ⎕IO←1  ⍝ so that x[1] is subset not x[0]
  n←⍎¨⍕⍵  ⍝ convert int to vec 
  s←{⌽@⍵⊢⍺}  ⍝ swap two elements
  swaps←{n s ⍵}  ⍝ apply swaps to a vec n
  opts←,(⍳≢n)∘.,⍳≢n ⍝ combinations of 1..n
  new←swaps¨opts  ⍝ perform the swaps
  keep←(~0=⊃¨new)/new  ⍝ filter out values starting with 0
  (⌈/,⌊/)10⊥¨keep  ⍝ max and min of ints
}

maxmin 213 
maxmin 12345
maxmin 100
maxmin 11321