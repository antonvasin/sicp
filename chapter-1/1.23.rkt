
#lang sicp
(#%require "../common.rkt")

(display "Exercice 1.23\n\n")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

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

 (timed-prime-test 1009)
 (timed-prime-test 1013)
 (timed-prime-test 1019)
 (timed-prime-test 10007)
 (timed-prime-test 10009)
 (timed-prime-test 10037)
 (timed-prime-test 100003)
 (timed-prime-test 100019)
 (timed-prime-test 100043)
 (timed-prime-test 1000003)
 (timed-prime-test 1000033)
 (timed-prime-test 1000037)

 (newline)

 (timed-prime-test 1000000007)
 (timed-prime-test 1000000009)
 (timed-prime-test 1000000021)
 (timed-prime-test 10000000019)
 (timed-prime-test 10000000033)
 (timed-prime-test 10000000061)
 (timed-prime-test 100000000003)
 (timed-prime-test 100000000019)
 (timed-prime-test 100000000057)
 (timed-prime-test 1000000000039)
 (timed-prime-test 1000000000061)
 (timed-prime-test 1000000000063)

; with next function

; 1009 *** 5
; 1013 *** 1
; 1019 *** 1
; 10007 *** 2
; 10009 *** 2
; 10037 *** 2
; 100003 *** 5
; 100019 *** 5
; 100043 *** 5
; 1000003 *** 15
; 1000033 *** 15
; 1000037 *** 15
;
; 1000000007 *** 403
; 1000000009 *** 452
; 1000000021 *** 377
; 10000000019 *** 1114
; 10000000033 *** 912
; 10000000061 *** 1024
; 100000000003 *** 2859
; 100000000019 *** 2899
; 100000000057 *** 2690
; 1000000000039 *** 8373
; 1000000000061 *** 8320
; 1000000000063 *** 8374

; without next function

; 1009 *** 3
; 1013 *** 1
; 1019 *** 1
; 10007 *** 2
; 10009 *** 2
; 10037 *** 2
; 100003 *** 5
; 100019 *** 6
; 100043 *** 5
; 1000003 *** 16
; 1000033 *** 16
; 1000037 *** 17
;
; 1000000007 *** 594
; 1000000009 *** 517
; 1000000021 *** 599
; 10000000019 *** 1661
; 10000000033 *** 1759
; 10000000061 *** 1619
; 100000000003 *** 5119
; 100000000019 *** 5101
; 100000000057 *** 5067
; 1000000000039 *** 13431
; 1000000000061 *** 14219
; 1000000000063 *** 13934

; the ratio is about 1.5 not 2
; probably because of additional if in the next procedure
