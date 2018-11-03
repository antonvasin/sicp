; Ex 1.2

(/ (+ 5
      4
      (- 2
        (- 3
          (+ 6
            (/ 1 3)))))

   (* 3
     (- 6 2)
     (- 2 7)))

; Ex 1.3

(define (sqrt a)
  (* a a))

(define (sum-sqrt a b)
  (+ (sqrt a) (sqrt b)))

(define (sum-sqrt-largest a b c)
  (cond ((and (> a c) (> b c)) (sum-sqrt a b))
        ((and (> b a) (> c a)) (sum-sqrt b c))
        ((and (> a b) (> c b)) (sum-sqrt a c))))

(sum-sqrt-largest 2 4 5)

; Ex 1.4
; Operator is defined by arguments of the procedure
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 5)
(a-plus-abs-b 3 -5)

; Ex 1.5
; Exercise 1.5. Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

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
