#lang sicp

(define (plus-recur a b)
  (if (= a 0)
      b
      (inc (plus-recur (dec a) b))))

(plus-recur 4 5)
; (inc (plus-recur 3 5))
; (inc (inc (plus-recur 2 5)))
; (inc (inc (inc (plus-recur 1 5))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

(define (plus-iter a b)
  (if (= a 0)
      b
      (plus-iter (dec a) (inc b))))

; (plus-iter 4 5)
; (plus-iter 3 6)
; (plus-iter 2 7)
; (plus-iter 1 8)
; (plus-iter 0 9)
; 9
