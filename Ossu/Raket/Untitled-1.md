strings e imagens



call to primitives works just like calls to number primitives



in bsl a string looks like > "this is a string"



we can put strings together with the string-append operator: like: (string-append "Ada" "Lovelace")



não da pra somar string com numero



(string-length "string") pra ver o tamanho das strings

(substring "Caribou" number number) > pega parte da string e retorna cortada, primeiro numero é o inicio e o segundo numero o final, o fim é excludente



0-base indexing



---

funcoes de imagens



funcao pra por imagens no racket > (require 2htdp/image)
o 2htdp diz que queremos usar as imagens da segunda edicao de como projetar um programa



há muitos primitivos pra imagens, como circle



(circle radius: number solid|outline color:string) > example (circle 10 "solid" "red") > pra funcionar precisa do (require 2htdp/image) antes



(rectangle  width height form color)



(text string fontsize color) produz uma imagem da string inserida no argumento



o primitivo above produz uma imagem com todos os argumentos empilhados e alinhados na horizontal



(beside ...) funciona parecido com o above mas pros lados



(overlay ...) coloca um argumento em cima do outro



tem funções que fazem estrelas e outras coisas e rodam como imagens no programa



---

constants definitions



facilitam pra outras pessoas lerem e mudarem



pra definir constantes (em maiusculo) > (define WIDTH 400) 
                                                                          (define HEIGTH 600)

expressões usando constantes



(rotate degrees item) pra rotacionar alguma imagem



---

functions



(define (bulb c)
  ;body of the function
)



um parametro significa um valor mutável 



(define (<functionName> <parameters> ...)

    <expression>

)

---

boolean and if expressions



;true
;false

(define WIDTH 100)
(define HEIGHT 100)

(> WIDTH HEIGHT)
(>= WIDTH HEIGHT)





codigo que verifica os tamanhos dos circulos

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

(< (image-width I1)
   (image-width I2))
















































