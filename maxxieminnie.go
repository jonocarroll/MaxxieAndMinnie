// Original version by @ayjaygee:
// https://github.com/ayjaygee/go-swapMaxMin

package main

import (
	"fmt"
	"slices"
	"strconv"
)

func MaxMin(n int) (max, min int) {
	s := strconv.Itoa(n)
	digits := []rune(s)
	max, min = n, n
	for i := range digits {
		for j := i + 1; j < len(digits); j++ {
			if i == 0 && digits[j] == '0' {
				continue
			}
			swapped := slices.Clone(digits)
			swapped[i], swapped[j] = swapped[j], swapped[i]
			curr, _ := strconv.Atoi(string(swapped))
			if curr > max {
				max = curr
			}
			if curr < min {
				min = curr
			}
		}
	}
	return max, min
}

func main() {
	fmt.Println(MaxMin(213))
	fmt.Println(MaxMin(12345))
	fmt.Println(MaxMin(100))
	fmt.Println(MaxMin(11321))
}
