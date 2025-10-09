(define (problem minerob-5x5-extreme)
  (:domain minerob)

  (:objects
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 
    a11 a12 a13 a14 a15 a16 a17 a18 a19 a20
    a21 a22 a23 a24 a25 - area
    carA carB carC carD carE - minecar
  )

  (:init
    ;; --- Adjacency (Completa 5x5) ---
    (adjacent a1 a2) (adjacent a2 a1) (adjacent a2 a3) (adjacent a3 a2) (adjacent a3 a4) (adjacent a4 a3) (adjacent a4 a5) (adjacent a5 a4)
    (adjacent a6 a7) (adjacent a7 a6) (adjacent a7 a8) (adjacent a8 a7) (adjacent a8 a9) (adjacent a9 a8) (adjacent a9 a10) (adjacent a10 a9)
    (adjacent a11 a12) (adjacent a12 a11) (adjacent a12 a13) (adjacent a13 a12) (adjacent a13 a14) (adjacent a14 a13) (adjacent a14 a15) (adjacent a15 a14)
    (adjacent a16 a17) (adjacent a17 a16) (adjacent a17 a18) (adjacent a18 a17) (adjacent a18 a19) (adjacent a19 a18) (adjacent a19 a20) (adjacent a20 a19)
    (adjacent a21 a22) (adjacent a22 a21) (adjacent a22 a23) (adjacent a23 a22) (adjacent a23 a24) (adjacent a24 a23) (adjacent a24 a25) (adjacent a25 a24)

    (adjacent a1 a6) (adjacent a6 a1) (adjacent a6 a11) (adjacent a11 a6) (adjacent a11 a16) (adjacent a16 a11) (adjacent a16 a21) (adjacent a21 a16)
    (adjacent a2 a7) (adjacent a7 a2) (adjacent a7 a12) (adjacent a12 a7) (adjacent a12 a17) (adjacent a17 a12) (adjacent a17 a22) (adjacent a22 a17)
    (adjacent a3 a8) (adjacent a8 a3) (adjacent a8 a13) (adjacent a13 a8) (adjacent a13 a18) (adjacent a18 a13) (adjacent a18 a23) (adjacent a23 a18)
    (adjacent a4 a9) (adjacent a9 a4) (adjacent a9 a14) (adjacent a14 a9) (adjacent a14 a19) (adjacent a19 a14) (adjacent a19 a24) (adjacent a24 a19)
    (adjacent a5 a10) (adjacent a10 a5) (adjacent a10 a15) (adjacent a15 a10) (adjacent a15 a20) (adjacent a20 a15) (adjacent a20 a25) (adjacent a25 a20)

    ;; --- Robot Start ---
    (robot-at a1)

    ;; --- Minecars Initial Positions ---
    (minecar-at carA a7)  
    (minecar-at carB a12) 
    (minecar-at carC a17) 
    (minecar-at carD a10) ; Carro en celda con minerales
    (minecar-at carE a16) 

    ;; --- Minerals Initial Positions ---
    (minerals a2)
    (minerals a5)
    (minerals a10) ; Con CarD
    (minerals a19)
    (minerals a24)
    (minerals a25)

    ;; --- Empty Bookkeeping ---
    ;; Todas las celdas sin minecar deben ser 'empty'
    (empty a1) (empty a2) (empty a3) (empty a4) (empty a5) (empty a6) 
    (empty a8) (empty a9) (empty a11) (empty a13) (empty a14) (empty a15) 
    (empty a18) (empty a19) (empty a20) (empty a21) (empty a22) (empty a23) (empty a24) (empty a25)

    ;; --- Depleted (Resto de celdas) ---
    (depleted a3) (depleted a4) (depleted a6) (depleted a8) (depleted a9) (depleted a11)
    (depleted a13) (depleted a14) (depleted a15) (depleted a18) (depleted a20) (depleted a21) (depleted a22) (depleted a23)
  )

  (:goal (and
    ;; --- Minerales Depleted ---
    (depleted a2)
    (depleted a5)
    (depleted a10)
    (depleted a19)
    (depleted a24)
    (depleted a25)
    
    ;; --- Final positions for minecars ---
    (minecar-at carA a2)
    (minecar-at carB a17)
    (minecar-at carC a12)
    (minecar-at carD a5)
    (minecar-at carE a20)

    ;; --- Final position for robot ---
    (robot-at a25)
  ))
)