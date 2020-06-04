#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

#|
a.

  1.      (sine 12.15)
  2.      (sine (p (sine 4.05)))
  3.      (sine (p (p (sine 1.35))))
  4.      (sine (p (p (p (sine 0.45)))))
  5.      (sine (p (p (p (p (sine 0.15))))))
  6.      (sine (p (p (p (p (p (sine 0.05)))))))
  7.   1. (sine (p (p (p (p (p 0.05))))))
  8.   2. (sine (p (p (p (p 0.1495)))))
  9.   3. (sine (p (p (p 0.4351345505))))
  10.  4. (sine (p (p 0.9758465331678772)))
  10.  5. (sine (p -0.7895631144708228))
  12.     (sine -0.3158508378678022)

b.
O(log(a))
|#

(sine 12.15)
