#lang sicp

;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

(define (pascal-triangle row column)
  ; edges
  (if (or (= column 0) (= row column))
    1
    ; sum of two elements above
    (+ (pascal-triangle (- row 1) (- column 1))
       (pascal-triangle (- row 1) column))))

(pascal-triangle 1 1)
(pascal-triangle 1 0)
(pascal-triangle 2 1)
(pascal-triangle 4 2)
