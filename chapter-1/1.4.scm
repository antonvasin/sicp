; Operator is defined by arguments of the procedure
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))

(a-plus-abs-b 3 5)
(a-plus-abs-b 3 -5)
