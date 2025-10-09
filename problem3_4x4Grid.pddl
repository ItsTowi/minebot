(define (problem minerob-4x4-puzzle)
  (:domain minerob)

  (:objects
    a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 - area
    carA carB carC - minecar
  )

  (:init
    ;; --- Adjacency (Horizontal) ---
    (adjacent a1 a2) (adjacent a2 a1) (adjacent a2 a3) (adjacent a3 a2) (adjacent a3 a4) (adjacent a4 a3)
    (adjacent a5 a6) (adjacent a6 a5) (adjacent a6 a7) (adjacent a7 a6) (adjacent a7 a8) (adjacent a8 a7)
    (adjacent a9 a10) (adjacent a10 a9) (adjacent a10 a11) (adjacent a11 a10) (adjacent a11 a12) (adjacent a12 a11)
    (adjacent a13 a14) (adjacent a14 a13) (adjacent a14 a15) (adjacent a15 a14) (adjacent a15 a16) (adjacent a16 a15)

    ;; --- Adjacency (Vertical) ---
    (adjacent a1 a5) (adjacent a5 a1) (adjacent a5 a9) (adjacent a9 a5) (adjacent a9 a13) (adjacent a13 a9)
    (adjacent a2 a6) (adjacent a6 a2) (adjacent a6 a10) (adjacent a10 a6) (adjacent a10 a14) (adjacent a14 a10)
    (adjacent a3 a7) (adjacent a7 a3) (adjacent a7 a11) (adjacent a11 a7) (adjacent a11 a15) (adjacent a15 a11)
    (adjacent a4 a8) (adjacent a8 a4) (adjacent a8 a12) (adjacent a12 a8) (adjacent a12 a16) (adjacent a16 a12)

    ;; Robot start
    (robot-at a10)

    ;; Minecars initial positions
    (minecar-at carA a1)
    (minecar-at carB a7)
    (minecar-at carC a14)

    ;; Empty bookkeeping:
    ;; All cells without a minecar must be declared empty.
    ;; Initially: a10 (robot), a2, a3, a4, a5, a6, a8, a9, a11, a12, a13, a15, a16
    (empty a2) (empty a3) (empty a4) (empty a5) (empty a6) (empty a8)
    (empty a9) (empty a10) (empty a11) (empty a12) (empty a13) (empty a15) (empty a16)

    ;; Minerals initial positions
    (minerals a1)  ; Con carA
    (minerals a7)  ; Con carB
    (minerals a14) ; Con carC

    ;; Depleted (all other cells start as depleted or without minerals)
    (depleted a2) (depleted a3) (depleted a4) (depleted a5) (depleted a6) (depleted a8)
    (depleted a9) (depleted a10) (depleted a11) (depleted a12) (depleted a13) (depleted a15) (depleted a16)
  )

  ;; Goal: all minerals collected (depleted) and specific final minecar positions
  (:goal (and
    (depleted a1)  ; Mineral en a1 recogido
    (depleted a7)  ; Mineral en a7 recogido
    (depleted a14) ; Mineral en a14 recogido
    
    ;; Final positions for minecars
    (minecar-at carA a2)
    (minecar-at carB a8)
    (minecar-at carC a15)

    ;; Final position for robot
    (robot-at a10)
  ))
)