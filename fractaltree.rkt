#lang racket
(require graphics/turtles)

;Apertura angular de cada hoja del arbol
(define anglevariation 20)

;Escalar que define la extensión de cada hoja
(define treescale 10)

;Desviación angular de cada apertura, simulando un arbol asimetrico
(define asymmetricangle 0)

;Cantidad de recursiones
(define treecount 10)

(define (tree n)
  ;
  (when (>= n 1) ; caso base
    
    (draw (* n treescale)) ; trazo
    
    (unless (zero? asymmetricangle)
      (turn asymmetricangle) ; desviación en caso de existir
      )

    ; generación de las hojas a partir de 2 desviaciones
    (tprompt
     (split*
      (turn anglevariation) ; 1ra desviacion
      (turn (* anglevariation -1)) ; 2da desviacion
      )
     (tree (- n 1)) ; funcion asociada a cada desviacion
     )
    )
  )
 
(turtles #t) ; inicializacion
(turn 90) ; mire arriba
(move -200) ; retroceda un poco
(tree treecount) ; dibuje :-)
(save-turtle-bitmap "tree.png" 'png) ; exporte
treecount
