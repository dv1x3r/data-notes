package main

import (
	"errors"
	"fmt"
	"math"
)

// https://www.toptal.com/developers/sorting-algorithms
// O rule #1: Growth is with respect to the input
// O rule #2: Constants are dropped O(2n) = O(n)
// O rule #3: Worst case is usually the way we measure
// O rule #4: If the input halves at each step, its likelu O(logN) or O(NlogN)

// Linear search O(n)
// Scans each haystack element in order to find needle.
func linearSearch(haystack []int, needle int) int {
	for i, v := range haystack {
		if v == needle {
			return i
		}
	}
	return -1
}

// Binary search O(logN)
// For n = 16 it takes 4 operations log2(16) = 4
// [ 01 02 04 08 16 32 64 ]
// -----------| N/2
// -----| N/4
// Math induction formula: N/2^k = 1 -> N = 2^k -> log2(N) = k
func binarySearch(haystack []int, needle int) int {
	lo, hi := 0, len(haystack)
	for lo < hi {
		m := lo + int((hi-lo)/2)
		if haystack[m] == needle {
			return m
		} else if haystack[m] < needle {
			lo = m + 1 // needle is on the right side
		} else {
			hi = m // needle is on the left side (exclusive)
		}
	}
	return -1
}

// Given two crystal balls that will break if dropped from high enough distance,
// determine the exact spot in which it will break in the most optimized way.
// binary + linear will give us O(n), intead we can use O(sqrt(N))
// in the worst case scenario, we will walk sqrt(N) times, instead of constant value
func crystalBalls(floors []int) int {
	// First ball
	step := int(math.Sqrt(float64(len(floors))))
	i := step
	for ; i < len(floors); i += step {
		if floors[i] == 1 {
			break
		}
	}
	// Second ball
	i -= step
	for ; i < len(floors); i++ {
		if floors[i] == 1 {
			return i
		}
	}
	return -1
}

// Bubble Sort O(n^2)
// For each N you need to compare it with the next value
// For each N you have an extra inner loop, which gives you ^2
// [1, 4, 8, 2, 0]
// [1, 4, 2, 0,|8] N
// [1, 2, 0,|4, 8] N - 1
// [1, 0,|2, 4, 8] N - 2
// [0,|1, 2, 4, 8] N - N + 1
func bubbleSort(arr []int) {
	for i := 0; i < len(arr); i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			if arr[j] > arr[j+1] {
				arr[j], arr[j+1] = arr[j+1], arr[j]
			}
		}
	}
}

// Quick Sort O(NlogN)
func quickSort(arr []int) {
	qsSort(arr, 0, len(arr)-1)
}

func qsSort(arr []int, lo, hi int) {
	if lo >= hi {
		return
	}
	pivotIdx := qsPartition(arr, lo, hi)
	qsSort(arr, lo, pivotIdx-1)
	qsSort(arr, pivotIdx+1, hi)
}

func qsPartition(arr []int, lo, hi int) int {
	pivot, idx := arr[hi], lo
	for i := lo; i < hi; i++ {
		if arr[i] <= pivot {
			arr[i], arr[idx] = arr[idx], arr[i]
			idx++
		}
	}
	arr[hi], arr[idx] = arr[idx], pivot
	return idx
}

func testSearch(haystack []int, fn func([]int, int) int) error {
	for i, v := range haystack {
		if r := fn(haystack, v); i != r {
			return errors.New(fmt.Sprintf(
				"expected: %d, returned: %d, value: %d",
				i, r, v))
		}
	}
	return nil
}

func testSort(arr []int, fn func([]int)) error {
	fn(arr)
	for i := 0; i < len(arr)-1; i++ {
		if arr[i] > arr[i+1] {
			return errors.New(fmt.Sprintf("%v", arr))
		}
	}
	return nil
}

// O(n) for search
type linkedList[T any] interface {
	length() int
	insertAt(item *T, index int)
	remove(item *T) *T
	removeAt(index int) *T
	append(item *T)
	prepand(item *T)
	get(index int) *T
}

// O(1) for everything
type queue[T any] interface {
	length() int
	enqueue(item *T)
	deque() *T
	peek() *T
}

// O(1) for everything
type stack[T any] interface {
	length() int
	push(item *T)
	pop() *T
	peek() *T
}

// O(n) for insert / delete
type arrayList[T any] interface {
	length() int
	capacity() int
}

// (Ring buffer) effective for delete or insert to the head or tail
// tail % len = index from the beginning
// [ . . . . 1 2 4 8 . . . . ]
// 0        [       ]        N
// [--->    h       t    --->]
type arrayBuffer[T any] interface {
}

func main() {
	if err := testSearch([]int{1, 2, 4, 8, 16, 32, 64, 128}, linearSearch); err != nil {
		fmt.Println("Linear Search:", err)
	}
	if err := testSearch([]int{1, 2, 4, 8, 16, 32, 64, 128}, binarySearch); err != nil {
		fmt.Println("Binary Search:", err)
	}
	if cb := crystalBalls([]int{0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1}); cb != 8 {
		fmt.Printf("Crystal Balls: expected: 8, value %d", cb)
	}
	if err := testSort([]int{1, 4, 8, 2, 0}, bubbleSort); err != nil {
		fmt.Println("Bubble Sort:", err)
	}
	if err := testSort([]int{1, 4, 8, 2, 0, 128, 64}, quickSort); err != nil {
		fmt.Println("Quick Sort:", err)
	}
	fmt.Println("Done!")
}
