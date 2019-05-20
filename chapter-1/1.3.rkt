#lang sicp
(define (square a)
	(* a a))

(define (sum-square a b)
	(+ (square a) (square b)))

(define (sum-square-largest a b c)
	(cond ((and (> a c) (> b c)) (sum-square a b))
				((and (> b a) (> c a)) (sum-square b c))
				((and (> a b) (> c b)) (sum-square a c))))

(sum-square-largest 2 4 5)
