#lang sicp
; Because the tolerance of good-enough? is 0.001 it would give wrong answers for very small numbers;
(sqrt 0.001)

; Because of limited prcision of flots such big number will cause our test to dive into endless recurssion. While refining our guess we reach such point where every assertion would be negative and we would infinetelly try to improve out guess.
; Will never return
; (sqrt 9999999999998)

(define (good-enough-better? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.001))

(define (sqrt-iter-better guess prev-guess x)
  (if (good-enough-better? guess prev-guess)
    guess
    (sqrt-iter-better (improve guess x)
          guess
          x)))

(define (sqrt-better x)
  (sqrt-iter-better 1.0 0 x))

(sqrt-better 0.001)
(sqrt-better 9999999999998)
