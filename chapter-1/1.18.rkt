#lang sicp

(#%require "../common.rkt")

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (iter-mult a b)
  (iter-mult-impl a b 0))

(define (iter-mult-impl a b n)
  (cond ((= b 0) n)
        ((even? a) (iter-mult-impl (halve a) (double b) n))
        (else (iter-mult-impl a (- b 1) (+ n a)))))

(iter-mult 7 5)
(iter-mult 8 5)
