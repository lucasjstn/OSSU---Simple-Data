;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise39) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;The radius of a car's wheel
(define WHEEL-RADIUS 5)

; A Wheel which uses WHEEL radius as constant
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))

(define W 50)
(define H 15)
;Car chasis
(define CHASIS (overlay/offset (rectangle W H "solid" "red") 0 -10
                        (rectangle 25 10 "solid" "red")))

(define SPACE 10)
(define WHEELS (overlay/offset WHEEL 30 0 WHEEL))

(define CAR (overlay/offset WHEELS 0 -10 CHASIS ))
CAR

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

tree

; Constants for width and height of the scene
(define BGWIDTH 600)
(define BGHEIGHT 50)

; empty scene
(define BACKGROUND (empty-scene BGWIDTH BGHEIGHT))

(define s (place-image tree (/ BGWIDTH 2) (image-height CAR) BACKGROUND))

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(check-expect (tock 29) 32)
(check-expect (tock 20) 23)
(define (tock cw) (+ cw 3))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
 ;(define (render cw)
;  (place-image CAR cw Y-CAR BACKGROUND))

; World State -> Image
; it will place the image in the scene every tick
(check-expect (render 3)
              (place-image CAR
                           (+ 3 ( / (image-width CAR) 2))
                           (- BGHEIGHT (image-height CAR)) BACKGROUND))

(define (render cw)
  (place-image CAR
               (+ cw ( / (image-width CAR) 2))
               (- BGHEIGHT (image-height CAR)) s))


(define (main cw)
 (big-bang cw
  [on-tick tock]
  [to-draw render]))

(main 0)