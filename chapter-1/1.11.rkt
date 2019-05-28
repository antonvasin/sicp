#lang sicp

(define (f-rec n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))) ))
        ))

(f-rec 2)
(f-rec 3)
(f-rec 4)

; (define (f-iter n)
;   (cond ((< n 3) n)
;         ((>= n 3) )
;         ))
