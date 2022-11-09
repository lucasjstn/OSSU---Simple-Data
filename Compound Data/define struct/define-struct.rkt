;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname define-struct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct pos (x y))
                   ; field names


(make-pos 3 6)
; constructor, the value of x is 3 and the value of y is 6
(define P1 (make-pos 3 6))
; you can put it on a constant 
(define P2 (make-pos 2 8))
(pos-x P1) ;it will return 3
(pos-y P2) ;it wil return 8

(pos? P1) ;it will return true somehow
(pos? "hello") ;it will return false