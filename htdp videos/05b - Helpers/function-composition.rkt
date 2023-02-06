;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function-composition) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Constants
(define BLANK (square 0 "solid" "white"))

;; Data definitions:

;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. An arbitrary number of images

(define LOI1 empty)
(define LOI2 (cons (rectangle 10 20 "solid" "blue")
                   (cons (rectangle 20 30 "solid" "blue")
                         empty)))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Functions:

;; ListOfImage -> Image
;; lay out images left to right in increasing order of size
;; sort images in increasing order of size and then lay them out left to right
(check-expect (arrange-images (cons (rectangle 10 20 "solid" "blue")
                                    (cons (rectangle 20 30 "solid" "red")
                                          empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))
(check-expect (arrange-images (cons (rectangle 20 30 "solid" "red")
                                    (cons (rectangle 10 20 "solid" "blue")
                                          empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))

;(define (arrange-images loi) BLANK) ;stub
(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place images beside each other in order of list
;; !!!
(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                                   (cons (rectangle 20 30 "solid" "red")
                                         empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))
;(define (layout-images loi) BLANK)

(define (layout-images loi)
  (cond [(empty? loi) BLANK]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
(check-expect (sort-images empty) empty)
(check-expect (sort-images  (cons (rectangle 20 30 "solid" "red")
                                  (cons (rectangle 10 20 "solid" "blue")
                                        empty)))
              (cons (rectangle 10 20 "solid" "blue")
                    (cons (rectangle 20 30 "solid" "red")
                          empty)))
(check-expect (sort-images  (cons (rectangle 10 20 "solid" "blue") 
                                  (cons (rectangle 20 30 "solid" "red")
                                        empty)))
              (cons (rectangle 10 20 "solid" "blue")
                    (cons (rectangle 20 30 "solid" "red")
                          empty)))
(check-expect (sort-images  (cons (rectangle 30 40 "solid" "blue") 
                                  (cons (rectangle 10 20 "solid" "red")
                                        (cons (rectangle 20 30 "solid" "green")
                                              empty))))
                            (cons (rectangle 10 20 "solid" "blue")
                                  (cons (rectangle 20 30 "solid" "red")
                                        (cons  (rectangle 30 40 "solid" "green") 
                                               empty))))
                           

;(define (sort-images loi) loi) ;stub

(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)
                 (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; produce new list, with img in proper place in list (in increasing order size)
;; !!!

(define (insert img lst) lst)