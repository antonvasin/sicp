#lang sicp
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
	(if (= x 0)
		0
		y))

; Then he evaluates the expression
; (test 0 (p))

; In applicative-order eveluatino it will result in infite recursion since `p`
; is defined by itself and evaluated in `test and in normal-order evaluation it
; will result in `0` since `p` is not evaluated
