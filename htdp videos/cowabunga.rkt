;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cowabunga) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Constants;

(define WIDTH 400)
(define HEIGHT 200)

(define CTR-Y (/ HEIGHT 2))

(define RCOW (rotate -90 (triangle 50 "solid" "green")))
(define LCOW (rotate 90 (triangle 50 "solid" "green")))

(define MTS (empty-scene WIDTH HEIGHT))

;; Data definitions
(define-struct cow (x dx))
;; Cow is (make-cow Natural[0, WIDTH], Integer)
;; interp. (make-cow x dx) is a cow with x coordinate and velocity dx
;;                   the x is the center of the cow
;;                   x is the screen coordinates [pixels]
;;                   dx is in pixels per tick

(define C1 (make-cow 10 3))  ; At 10, moving left > right
(define C2 (make-cow 20 -4)) ; At 20, moving left < right


#;
(define (fn-for-cow c)
  (... (cow-x c)       ; Natural[0, WIDTH]
       (cow-dx c)))    ; Integer


;==================
; Functions

;; Cow -> Cow
;; called to make the cow go for a walk; start with (main (make-cow 0 3))
;; no tests for main function
(define (main c)
  (big-bang c
    (on-tick next-cow)    ; Cow -> Cow
    (to-draw render-cow)    ; Cow -> Image
    (on-key handle-key)))  ; Cow KeyEvent -> Cow

;; Cow -> Cow
;; increases cow x by dx; bounce off edges
(check-expect (next-cow (make-cow 20 3)) (make-cow (+ 20 3) 3))   ;middle cases
(check-expect (next-cow (make-cow 20 -3)) (make-cow (- 20 3) -3))

(check-expect (next-cow (make-cow (- WIDTH 3) 3)) (make-cow WIDTH 3)) ;reaches the edge
(check-expect (next-cow (make-cow    3       -3)) (make-cow 0    -3))

(check-expect (next-cow (make-cow (- WIDTH 2) 3)) (make-cow WIDTH -3)) ; tries to pass edge
(check-expect (next-cow (make-cow    2       -3)) (make-cow 0      3))

;(define (next-cow c) c)

(define (next-cow c)
  (cond [(> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow WIDTH (- (cow-dx c)))]
        [(< (+ (cow-x c) (cow-dx c)) 0)     (make-cow 0     (- (cow-dx c)))]
        [else
         (make-cow (+ (cow-x c) (cow-dx c))
               (cow-dx c))]))
        

;; Cow -> Image
;; place appropriate cow image on MTS at (cow-x c) and CTR-Y
(check-expect (render-cow (make-cow 99 3))
              (place-image RCOW 99 CTR-Y MTS))
(check-expect (render-cow (make-cow 99 -3))
              (place-image LCOW 99 CTR-Y MTS))

;(define (render-cow c) MTS) ;stub

(define (render-cow c) ; as render cow would have two task we divided into two functions
  (place-image (choose-image c) (cow-x c) CTR-Y MTS))      

;; Cow -> Image
;; will choose which image of cow will use
(check-expect (choose-image (make-cow 99  3)) RCOW)
(check-expect (choose-image (make-cow 99 -3)) LCOW)

(define (choose-image c)
  (if (> (cow-dx c) 0)
      RCOW
      LCOW))

;; Cow KeyEvent -> Cow
;; reverse direction of cow travel when space bar is pressed
;; !!!
(check-expect (handle-key (make-cow 99  3) " ") (make-cow 99 -3))
(check-expect (handle-key (make-cow 99 -3) " ") (make-cow 99  3))

(define (handle-key c ke)
  (cond
    [(key=? ke " ") (make-cow (cow-x c) (- (cow-dx c)))]
    [else (make-cow (cow-x c) (cow-dx c))]))

