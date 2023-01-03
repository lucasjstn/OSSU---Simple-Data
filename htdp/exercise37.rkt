;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Use string to represent another string
; String -> String

;stub
;(define (string-rest s) "word")

(check-expect (string-rest "furou") "urou")
(check-expect (string-rest "fogo") "ogo")

(define (string-rest s)
  (substring s 1 (string-length s)))