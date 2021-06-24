;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname lookup-in-bst-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; lookup-in-bst-starter.rkt

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

;; Functions:

;; BST Natural -> String or #false
;; Try to find node with given key, if found produce value; if not found produce false.
(check-expect (lookup-key BST0 99) #false)
(check-expect (lookup-key BST1 1) "abc")
(check-expect (lookup-key BST1 0) #false)
(check-expect (lookup-key BST1 99) #false)
(check-expect (lookup-key BST10 1) "abc")
(check-expect (lookup-key BST10 4) "dcj")
(check-expect (lookup-key BST10 27) "wit")
(check-expect (lookup-key BST10 50) "dug")

;(define (lookup-key t k) "") ;stub

;<template according to BST, and additional atomic parameter k>

(define (lookup-key t k)
  (cond [(false? t) #false]
        [else
         (cond [(= k (node-key t)) (node-val t)]
               [(< k (node-key t)) (lookup-key (node-l t) k)]
               [(> k (node-key t)) (lookup-key (node-r t) k)])
         ]))
