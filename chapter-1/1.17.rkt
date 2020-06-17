#lang sicp

(#%require "../common.rkt")

(define (mult-lin a b)
  (if (= b 0)
    0
    (+ a (mult-lin a (- b 1)))))

(mult-lin 2 10)

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (mult-log a b)
  (cond ((= b 0) 0)
        ((even? a) (double (mult-log b (halve a))))
        ((even? b) (double (mult-log a (halve b))))
        (else (+ a (mult-log a (- b 1))))))

#|
(* 2 10)
(dobule (* 2 5))
(dobule (+ 2 (* 2 4)))
(dobule (+ 2 (double (* 2 2))))
(dobule (+ 2 (double (double (* 2 1)))))
(dobule (+ 2 (double (double (+ 2 (* 2 0))))))
(dobule (+ 2 (double (double (+ 2 0)))))
(dobule (+ 2 (double (double 2))))
(dobule (+ 2 (double 4)))
(dobule (+ 2 8))
(dobule 10)
20
|#
(mult-log 2 10)
