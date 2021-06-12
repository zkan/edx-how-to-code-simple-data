;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname naturals-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Natural -> Natural
;; produce sum of Natural[0, n]
(check-expect (sum 0) 0)
(check-expect (sum 1) 1)
(check-expect (sum 3) (+ 3 2 1 0))

;(define (sum n) 0) ;stub

(define (sum n)
  (cond [(zero? n) 0]
        [else
         (+ n
            (sum (sub1 n)))]))

;; Natural -> ListOfNatural
;; produce (cons n-1 ... '()), not including 0
(check-expect (to-list 0) '())
(check-expect (to-list 1) (cons 1 '()))
(check-expect (to-list 3) (cons 3 (cons 2 (cons 1 '()))))

;(define (to-list n) '()) ;stub

(define (to-list n)
  (cond [(zero? n) '()]
        [else
         (cons n
               (to-list (sub1 n)))]))