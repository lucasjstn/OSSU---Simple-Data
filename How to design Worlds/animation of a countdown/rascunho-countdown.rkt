;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rascunho-countdown) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; A simple countdown animation.

;; Constants:

(define WIDTH 50)
(define HEIGHT 50)

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define MTS (empty-scene WIDTH HEIGHT))

(define TEXT-SIZE 24)
(define TEXT-COLOR "black")

;; =================
;; Data definitions

;; A countdown is Natural[0, 10]
;; interp. the current seconds remaining in the countdown

(define T1 0)  ;end
(define T2 10) ;start
(define T3 5)  ;middle

#;
(define (fn-for-countdown cd)
  (...cd))

;; Template rules used:
;; - atomic non-distinct: Integer[0, 10]

(check-expect (countdown 2) 1)
(check-expect (countdown 10) 9)

(define (countdown cd) 0)
;; =============
;(define (fn-for-countdown x)
;  (if (and (<= 0 x)
;     (<= x 10))
;     (- x 1)
;     -1
;))
;
;(fn-for-countdown 10)
