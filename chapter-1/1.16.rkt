#lang sicp

(#%require "../common.rkt")

#| recursive |#
(define (expt-rec b n)
  (if (= n 0)
    1
    (* b (expt-rec b (- n 1)))))

#| iterative |#
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

#|
(expt 2 8)
(expt-iter 2 8 1)
(expt-iter 2 7 2)
(expt-iter 2 6 4)
(expt-iter 2 5 8)
(expt-iter 2 4 16)
...
256
|#

#| successive squaring |#
(define (fast-expt-ex b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt-ex b (/ n 2))))
        (else
          (* b (fast-expt-ex b (- n 1))))))

(fast-expt-ex 2 8)

#| iterative successive squaring |#
(define (fast-iter b n)
  (fast-expt b n 1))

(define (fast-expt b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt (square b) (/ n 2) a))
        (else (fast-expt b (- n 1) (* b a)))))

#|
(fast-expt 2 8 1)
(fast-expt 4 4 1)
(fast-expt 16 2 1)
(fast-expt 256 1 1)
(fast-expt 256 0 256)
256
|#

(fast-iter 2 8)
