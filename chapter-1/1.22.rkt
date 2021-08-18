#lang sicp
(#%require "../common.rkt")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; fast-prime?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime)
                     start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; 1.22
(newline)
(display "Exercice 1.22\n\n")

(define (search-for-primes start end)
  (define (search-iter cur)
    (if (<= cur end)
      (timed-prime-test cur))
    (if(<= cur end)
      (search-iter (+ 2 cur))))
  (search-iter (if (odd? start) start (+ 1 start))))


; 1009	1013	1019
(search-for-primes 1000 1100)

; 10007 10009  10037
(search-for-primes 10000 10100)

; 100003 100019 100043
(search-for-primes 100000 100100)

(search-for-primes 1000000 1000100)

; time grows by the order of 3 whic ≈ √10 thus validating that program run time
; is proportional to the number of steps
