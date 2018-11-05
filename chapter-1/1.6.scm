(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter-new-if (improve guess x)
      x)))

(sqrt-iter-new-if 1.0 9)

; Infinite recurssino resulting in stack overflow. Due to applicative-order interpreter `else` clause is always evaluated.
