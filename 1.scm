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
