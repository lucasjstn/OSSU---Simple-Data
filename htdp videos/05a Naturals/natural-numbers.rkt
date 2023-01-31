;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname natural-numbers) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(add1 0) produces a natural 1 bigger
;(sub1 2) produces a natural 1 smaller

;; Natural is one of:
;;  - 0 base case
;;  - (add1 Natural)
;;  interp. a natural number

(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... n                              ;template rules wouldnt normally put this
          ;                               ;here, but we will see that we end up coming
          ;                               ;back to add it
          (fn-for-natural (sub1 n)))]))

;; Template rules used:
;;   - one-of: two cases
;;   - atomic distinct: 0
;;   - compound: (add1 Natural)
;;   - self-reference: (sub1 n) is Natural

;; Natural -> Natural
;; produce sum of Natural[0, n]
(check-expect (sum 0) 0) ; base case test
(check-expect (sum 1) 1)
(check-expect (sum 3) (+ 0 1 2 3))

;(define (sum n) 0)

(define (sum n)
  (cond [(zero? n) (+ n 0)]
        [else
         (+   n
              (sum (sub1 n)))]))

;; Natural -> ListOfNatural
;; produce a list of naturals starting with n and going n-1
(check-expect (to-list 0) empty)
(check-expect (to-list 1) (cons 1 empty))
(check-expect (to-list 2) (cons 2 (cons 1 empty)))

;(define (to-list n) empty) ;stub


(define (to-list n)
  (cond [(zero? n) empty]
        [else
         (cons n 
          (to-list (sub1 n)))]))