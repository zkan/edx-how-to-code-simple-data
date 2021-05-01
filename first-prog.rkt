;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname first-prog) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(+ 2 3 4 5)
(+ 3 (* 2 3))
(/ 12(* 3 2))

; This line is a comment

(sqr 3)
(sqrt 16)

; To evaluate a primitive call:
; - Reduce operands to values
; - Apply primitive to the values

(+ 2 (* 3 4) (- (+ 1 2) 3)) ; initial
(+ 2 12      (- (+ 1 2) 3)) ; 1st step
(+ 2 12      (- 3       3)) ; 2nd step
(+ 2 12      0)             ; 3rd step
14                          ; last step

(sqrt 2)

"Apple" ; string

(string-append "Kan" " " "Ouivirach")
(string-length "Hello World")

; zero-based indexing
(substring "Hello World" 2 4)

(substring "Caribou" 0 3)
