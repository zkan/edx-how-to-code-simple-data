;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images-starter.rkt

;; Data definitions

;; ListOfImages is one of:
;;  - '()
;;  - (cons Image ListOfImage)
;; interp. a list of images

(define LOI1 '())
(define LOI2 (cons (rectangle 10 20 "solid" "blue")
                   (cons (rectangle 20 30 "solid" "red")
                         '())))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else (... (first loi)
                   (fn-for-loi (rest loi)))]))