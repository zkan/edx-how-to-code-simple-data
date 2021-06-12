;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname new-numerals-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; NATURAL is one of
;;  - '()
;;  - (cons "|" NATURAL)
;; interp. a natural number, the number of "|" in the list represents a natural number.

(define N0 '())           ;0
(define N1 (cons "|" N0)) ;1
(define N2 (cons "|" N1)) ;2
(define N3 (cons "|" N2)) ;3
(define N4 (cons "|" N3)) ;4
(define N5 (cons "|" N4)) ;5
(define N6 (cons "|" N5)) ;6
(define N7 (cons "|" N6)) ;7
(define N8 (cons "|" N7)) ;8
(define N9 (cons "|" N8)) ;9

;; primitive functions
(define (ZERO? n) (empty? n))
(define (ADD1 n) (cons "|" n))
(define (SUB1 n) (rest n))

#;
(define (fn-for-NATURAL n)
  (cond [(ZERO? n) (...)]
        [else
         (... n
              (fn-for-NATURAL (SUB1 n)))]))

;; NATURAL NATURAL -> NATURAL
;; produce a + b
(check-expect (ADD N2 N0) N2)
(check-expect (ADD N0 N2) N2)
(check-expect (ADD N3 N4) N7)

;(define (ADD a b) N0) ;stub

(define (ADD a b)
  (cond [(ZERO? b) a]
        [else      
         (ADD (ADD1 a) (SUB1 b))]))