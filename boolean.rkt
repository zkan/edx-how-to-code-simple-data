;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Boolean & Condition

#true
#false

(= 1 2)
(> 3 4)
(<= 2 7)

(string=? "foo" "bar")
(string=? "foo" "foo")

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

(if (< (image-width I1)
       (image-height I1))
    "tall"
    "long")
