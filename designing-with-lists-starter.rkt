;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing-with-lists-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Data Definitions:

;; List OfNumber is one of:
;;  - '()
;;  - (cons Number ListOfNumber)
;; interp. each number is the list is an owl weight in ounces

(define LON1 '())
(define LON2 (cons 60 (cons 42 '())))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)                 ; Number
              (fn-for-lon (rest lon)))])) ; ListOfNumber

;; Template rules used:
;;  - one of : 2 cases
;;  - atomic distint: '()
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;Functions:

;; ListOfNumber -> Number
;; produce sum of weights of all the owls inlon

(check-expect (sum '()) 0)
(check-expect (sum (cons 20 '())) 20)
(check-expect (sum (cons 32 (cons 20 '()))) (+ 32 20))

;(define (sum lon) 0)

(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)          ; Number
            (sum (rest lon)))])) ; ListOfNumber

;Functions:

;; ListOfNumber -> Natural
;; produce total number of owls in consumed list

(check-expect (count '()) 0)
(check-expect (count (cons 12 '())) 1)
(check-expect (count (cons 35 (cons 12 '()))) 2)

;(define (count lon) 0) ;stub

(define (count lon)
  (cond [(empty? lon) 0]
        [else
         (+ 1                      ; Number
            (count (rest lon)))])) ; ListOfNumber