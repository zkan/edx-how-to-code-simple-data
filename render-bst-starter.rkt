;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname render-bst-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; render-bst-starter.rkt

(require 2htdp/image)

(define-struct node (key val l r))
;; BST is one of:
;;  - #false
;;  - (make-node Integer String BST BST)
;; interp. #false means no BST, or empty BST
;;         key is the node key
;;         val is the node value
;;         l and r are left and right sub-trees
;;         the same key never appears twice in the tree

(define BST0 #false)
(define BST1 (make-node 1 "abc" #false #false))
(define BST4 (make-node 4 "dcj" #false (make-node 7 "ruf" #false #false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42
  (make-node 42 "ily"
             (make-node 27 "wit" (make-node 14 "olp" #false #false) #false)
             (make-node 50 "dug" #false #false)))
(define BST10 (make-node 10 "why" BST3 BST42))

#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)                ;Integer
              (node-val t)                ;String
              (fn-for-bst (node-l t))     ;BST
              (fn-for-bst (node-r t)))])) ;BST

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: #false
;;  - compound: (make-node Integer String BST BST)
;;  - self-reference: (node-l t) is BST
;;  - self-reference: (node-r t) is BST

;; Constants:

(define TEXT-SIZE 14)
(define TEXT-COLOR "black")

(define SEPARATOR ":")

(define VSPACE (rectangle 1 10 "solid" "white"))
(define HSPACE (rectangle 10 1 "solid" "white"))

;; Functions:

;; BST -> Image
;; produce a SIMPLE rendering of the tree

(check-expect (render-bst BST0) empty-image)
(check-expect (render-bst BST1) (above (text (string-append "1" SEPARATOR "abc")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst BST0)
                                               HSPACE
                                               (render-bst BST0))))

(check-expect (render-bst BST4) (above (text (string-append "4" SEPARATOR "dcj")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst BST0)
                                               HSPACE
                                               (render-bst (make-node 7 "ruf" #false #false)))))

(check-expect (render-bst BST3) (above (text (string-append "3" SEPARATOR "ilk")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       VSPACE
                                       (beside (render-bst BST1)
                                               HSPACE
                                               (render-bst BST4))))

;(define (render-bst t) empty-image) ;stub

(define (render-bst t)
  (cond [(false? t) empty-image]
        [else
         (above (text (string-append (number->string (node-key t)) SEPARATOR (node-val t))
                      TEXT-SIZE
                      TEXT-COLOR)
                VSPACE
                (beside (render-bst (node-l t))
                        HSPACE
                        (render-bst (node-r t))))]))