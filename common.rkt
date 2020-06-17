#lang sicp
(define (even? n)
  (= (remainder n 2) 0))

(define (square a)
	(* a a))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(#%provide even? square sum-of-squares)
