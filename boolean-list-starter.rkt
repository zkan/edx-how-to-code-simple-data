;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean-list-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data definitions:

;; ListOfBoolean is one of
;;  - '()
;;  - (cons Boolean ListOfBoolean)
;; interp. a list of boolean

(define LOB1 '())
(define LOB2 (cons #true '()))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;;  - one of : 2 cases
;;  - atomic distint: '()
;;  - compound: (cons Boolean ListOfBoolean)
;;  - self-reference: (rest lob) is ListOfBoolean

;; Functions:

;; ListOfBoolean -> Boolean
;; produces true if every value in the list is true

(check-expect (all-true? '()) #true)
(check-expect (all-true? (cons #true '())) #true)
(check-expect (all-true? (cons #false '())) #false)
(check-expect (all-true? (cons #true (cons #false '()))) #false)
(check-expect (all-true? (cons #true (cons #true '()))) #true)
(check-expect (all-true? (cons #true (cons #true (cons #true '())))) #true)
(check-expect (all-true? (cons #true (cons #false (cons #true '())))) #false)

;(define (all-true? lob) #false) ;stub

(define (all-true? lob)
  (cond [(empty? lob) #true]
        [else
         (and (first lob)
              (all-true? (rest lob)))]))
