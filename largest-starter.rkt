;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname largest-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ListOfNumer -> Number
;; consumes a list of numbers and produces the largest number in the list

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

(check-expect (largest '()) 0)
(check-expect (largest (cons 10 '())) 10)
(check-expect (largest (cons 5 (cons 10 '()))) 10)
(check-expect (largest (cons 7 (cons 20 (cons 10 '())))) 20)

;(define (largest lon) 0) ;stub

; use template list of number

(define (largest lon)
  (cond [(empty? lon) 0]
        [else
         (if (> (first lon)
                (largest (rest lon)))
             (first lon)
             (largest (rest lon)))]))