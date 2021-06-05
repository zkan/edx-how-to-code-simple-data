;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-all-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ListOfNumber -> ListOfNumber
;; produce a list of doubled numbers

(check-expect (double-all '()) '())
(check-expect (double-all (cons 2 '())) (cons 4 '()))
(check-expect (double-all (cons 3 (cons 2 '()))) (cons 6 (cons 4 '())))

;(define (double-all lon) '()) ;stub

; use template from ListOfNumber

(define (double-all lon)
  (cond [(empty? lon) '()]
        [else
         (cons (* 2 (first lon))
               (double-all (rest lon)))]))