if conditions using racket

(require 2htdp/image)

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

(< (image-width I1)
   (image-width I2))

(if (< (image-width I1)
       (image-height I1))
    "tall"
"wide")

the condition that is not chosen will be highlighted

---

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

;(if and (< (image-width I1) (image-width I2)(< (image-width I1) (image-width I2))
 ;(> (image-height I1) (image-height I2))

;)

(if (or (< (image-width I1) (image-width I2))
         (> (image-height I1) (image-height I2))

         )

"alo"
         "sadam"
)

---

using the stepper

---
