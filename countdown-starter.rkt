;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CountDown is one of:
;;  - #false
;;  - Natural[1, 10]
;;  - "complete"
;; interp.
;;     #false         means not yet started
;;     Natural[1, 10] means countdown before midnight
;;     "complete"     means countdow is over

(define CD1 #false)
(define CD2 10)         ; just start running
(define CD3 5)
(define CD4 1)          ; almost over
(define CD5 "complete")

#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c 10)) (... c)]
        [(string=? c "complete") (...)]))

#;
(define (fn-for-countdown1 c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c 10)) (... c)]
        [else (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct value: #false
;;  - atomic non-distinct value: Natural[1, 10]
;;  - atomic distinct value: "complete"