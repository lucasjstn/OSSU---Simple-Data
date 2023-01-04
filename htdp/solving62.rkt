;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname solving62) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;constants
(define CLOSED "closed")
(define LOCKED "locked")
(define OPEN "open")

; DoorState is one of:
; - closed
; - locked
; - open

; KeyEvents is one of:
; ~ "u" means unlock
; ~ "l" means lock
; ~ " " means open

; DoorState -> DoorState
; this function will receive a door state
; and close the door on a matched state
(define (fn-door-closer cs)
  ...)

; DoorState KeyEvent -> DoorState
; this function will receive a key press and will translate it into a DoorState
(define (fn-door-action cs ke)
  ...)

; DoorState -> Image
; display an Image for the given DoorState 
(define (fn-door-image cs)
  ...)

(define (main cs)
  (big-bang cs)
  [to-draw])