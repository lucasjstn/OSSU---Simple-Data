;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname first-lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define L1 (cons "Flames" empty))               ;a list of 1 element
(define L2 (cons 10 (cons 9 (cons 10 empty))))  ; a list of 3 elements
(define L3 (cons (square 10 "solid" "blue")
           (cons (triangle 20 "solid" "green")
                 empty)))

;(first L1) ; accessing the list's item
;(first L2)
;(first L3)

;rest consumes a list with at least one element and produces
; the list after the first element
(rest L1)
(rest L2)
(rest L3)

(first (rest L2))           ; getting the second element
(first (rest (rest L2)))    ; getting the third element

(empty? empty) ; predicate to know if the list is empty
(empty? L1)
(empty? 34)