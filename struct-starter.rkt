;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname struct-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 2+ values naturally belong together

(define-struct pos (x y))

;constructors
(define P1 (make-pos 3 6))
(define P2 (make-pos 2 8))

;selectors
(pos-x P1) ;3
(pos-y P2) ;8

;predicate
(pos? P1) ;#true
(pos? "hello") ;#false

;To form a structure definition:
;(define-struct <structure-name> (<field-name>...))
;Constructor -> make-<structure-name>
;Selector(s) -> <structure-name>-<field-name>
;Predicate   -> <structure-name>?