#lang sicp

(define (f-rec n)
  #| (display "n: ") (display n) (display "\n") |#
  (cond ((< n 3) n)
        (else (+
                (f-rec (- n 1))
                (* 2 (f-rec (- n 2)))
                (* 3 (f-rec (- n 3)))))
        ))

(f-rec 2)
(f-rec 3)
(f-rec 4)

#|
(f 4)
(+ (f 3) (* 2 (f 2)) (* 3 (f 1)))
(+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) (* 2 2) (* 3 1))
(+ (+ 2 (* 2 1) (* 3 0)) (* 2 2) (* 3 1))
(+ (+ 2 2 0) 4 3)
(+ 4 4 3)
11
|#

(define (f n)
  (cond ((< n 3) n)
        (else (f-iter 0 1 2 (- n 2)))))

(define (f-iter a b c counter)
  (display a) (display " ")
  (display b) (display " ")
  (display c) (display " ")
  (display counter) (display " ")
  (display "\n")
  (if (= counter 0)
    c
    (f-iter b c (+ c (* 2 b) (* 3 a)) (- counter 1))))

#|
(f 6)
(f-iter 0 1 2 4)
(f-iter 1 2 4 3)
(f-iter 2 4 11 2)
(f-iter 4 11 25 1)
(f-iter 11 25 59 0)
59
|#

(f 6)
