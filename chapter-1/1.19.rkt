#lang sicp

(#%require "../common.rkt")

#|
a = bq + aq + ap
b = bp + aq


a = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p =
  bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2 =
  bpq + bq^2 + bpq + aq^2 + aq^2 + apq + apq + ap^2 =
  b(2pq + q^2) + a(2pq + q^2) + a(q^2 + p^2)

b = (bp + aq)p + (bq + aq + ap)q =
  bpp + aqp + bq^2 + aq^2 + aqp =
  bp^2 + apq + bq^2 + aq^2 + apq =
  bp^2 + bq^2 + apq + apq + aq^2 =
  b(p^2 + q^2) + a(2pq + q^2)

a = bq' + aq' + ap'
b = bp' + aq'

p' = p^2 + q^2
q' = 2pq + q^2
|#

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (sum-of-squares p q)
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))

(fib 10)
