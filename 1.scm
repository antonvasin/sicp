; Example 1.2

(/ (+ 5
      4
      (- 2
        (- 3
          (+ 6
            (/ 1 3)))))

   (* 3
     (- 6 2)
     (- 2 7)))


; Example 1.3

(define (square a)
	(* a a))

(define (sum-square a b)
	(+ (square a) (square b)))

(define (sum-square-largest a b c)
	(cond ((and (> a c) (> b c)) (sum-square a b))
				((and (> b a) (> c a)) (sum-square b c))
				((and (> a b) (> c b)) (sum-square a c))))

(sum-square-largest 2 4 5)


; Example 1.4
; Operator is defined by arguments of the procedure
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))

(a-plus-abs-b 3 5)
(a-plus-abs-b 3 -5)


; Example 1.5
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


; 1.1.7 Square Roots by Newton’s Method

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
          x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x )) 0.001))

(define (sqrt x)
	(sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))


; Example  1.6

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


; Example 1.7

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
