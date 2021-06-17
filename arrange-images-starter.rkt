;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images-starter.rkt

;; Data definitions:

;; ListOfImage is one of:
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

;; Functions:

;; ListOfImage -> Image
;; lay out images left to right in increasing order of size

;(check-expect (arrange-images '()) empty-image) ; not necessary
(check-expect (arrange-images (cons (rectangle 10 20 "solid" "blue")
                                    (cons (rectangle 20 30 "solid" "red")
                                          '())))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      empty-image))
(check-expect (arrange-images (cons (rectangle 20 30 "solid" "red")
                                    (cons (rectangle 10 20 "solid" "blue")
                                          '())))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      empty-image))

;(define (arrange-images loi) empty-image) ;stub

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place image beside each other in order of list
(check-expect (layout-images '()) empty-image)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                                   (cons (rectangle 20 30 "solid" "red")
                                         '())))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      empty-image))

;(define (layout-images loi) empty-image) ;stub

(define (layout-images loi)
  (cond [(empty? loi) empty-image]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
;; !!!
(define (sort-images loi) loi)

