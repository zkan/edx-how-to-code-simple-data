;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images-starter.rkt

(define I1 (rectangle 10 20 "solid" "blue"))
(define I2 (rectangle 20 30 "solid" "red"))
(define I3 (rectangle 30 40 "solid" "green"))

;; Data definitions:

;; ListOfImage is one of:
;;  - '()
;;  - (cons Image ListOfImage)
;; interp. a list of images

(define LOI1 '())
(define LOI2 (cons I1
                   (cons I2
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
(check-expect (arrange-images (cons I1
                                    (cons I2
                                          '())))
              (beside I1
                      I2
                      empty-image))
(check-expect (arrange-images (cons I2
                                    (cons I1
                                          '())))
              (beside I1
                      I2
                      empty-image))

;(define (arrange-images loi) empty-image) ;stub

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place image beside each other in order of list
(check-expect (layout-images '()) empty-image)
(check-expect (layout-images (cons I1
                                   (cons I2
                                         '())))
              (beside I1
                      I2
                      empty-image))

;(define (layout-images loi) empty-image) ;stub

(define (layout-images loi)
  (cond [(empty? loi) empty-image]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; sort images in increasing order of size (area)
(check-expect (sort-images '()) '())
(check-expect (sort-images (cons I1 (cons I2 '())))
              (cons I1 (cons I2 '())))
(check-expect (sort-images (cons I2 (cons I1 '())))
              (cons I1 (cons I2 '())))
(check-expect (sort-images (cons I3 (cons I1 (cons I2 '()))))
              (cons I1 (cons I2 (cons I3 '()))))

;(define (sort-images loi) loi) ;stub

(define (sort-images loi)
  (cond [(empty? loi) '()]
        [else
         (insert (first loi)
                 (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; insert image in proper place in loi (in increasing order of size)
;; ASSUME: loi is already sorted

(check-expect (insert I1 '()) (cons I1 '()))
(check-expect (insert I1 (cons I2 (cons I3 '()))) (cons I1 (cons I2 (cons I3 '()))))
(check-expect (insert I2 (cons I1 (cons I3 '()))) (cons I1 (cons I2 (cons I3 '()))))
(check-expect (insert I3 (cons I1 (cons I2 '()))) (cons I1 (cons I2 (cons I3 '()))))

;(define (insert img loi) loi) ;stub

(define (insert img loi)
  (cond [(empty? loi) (cons img '())]
        [else
         (if (larger? img (first loi))
             (cons (first loi) (insert img (rest loi)))
             (cons img loi))]))

;; Image Image -> Boolean
;; produce #true if first img is larger than second img (by area)

(check-expect (larger? (rectangle 1 4 "solid" "red")
                       (rectangle 2 6 "solid" "red"))
              #false)
(check-expect (larger? (rectangle 3 4 "solid" "red")
                       (rectangle 2 6 "solid" "red"))
              #false)
(check-expect (larger? (rectangle 3 5 "solid" "red")
                       (rectangle 2 6 "solid" "red"))
              #true)

;(define (larger? img1 img2) #false) ;stub

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))