(define (problem minerob-second-example-3x3)
  (:domain minerob)

  (:objects
    a1 a2 a3 a4 a5 a6 a7 a8 a9 - area
    carA - minecar
  )

  ;; initial state
  (:init
    ;; adjacency (grid 3x3)
    ;; row 1
    (adjacent a1 a2) (adjacent a2 a1)
    (adjacent a2 a3) (adjacent a3 a2)
    (adjacent a4 a5) (adjacent a5 a4)
    (adjacent a5 a6) (adjacent a6 a5)
    (adjacent a7 a8) (adjacent a8 a7)
    (adjacent a8 a9) (adjacent a9 a8)

    (adjacent a1 a4) (adjacent a4 a1)
    (adjacent a2 a5) (adjacent a5 a2)
    (adjacent a3 a6) (adjacent a6 a3)
    (adjacent a4 a7) (adjacent a7 a4)
    (adjacent a5 a8) (adjacent a8 a5)
    (adjacent a6 a9) (adjacent a9 a6)

    ;; robot start
    (robot-at a1)

    ;; minecars initial positions
    (minecar-at carA a9)

    ;; empty bookkeeping: any cell with no minecar must be declared empty
    (empty a1)
    (empty a2) 
    (empty a3) 
    (empty a4) 
    (empty a5)
    (empty a6)  
    (empty a7) 
    (empty a8)

    ;; minerals (some cells have minerals
    (minerals a1)
    (minerals a2)
    (minerals a3)
    (minerals a4)
    (minerals a5)
    (minerals a6)
    (minerals a7)
    (minerals a8)
    (minerals a9)

    ; No depleted cells
    
  )

  ;; goal: all minerals collected (depleted) and specific final minecar positions
  (:goal (and

    ; Recolected materials
    (depleted a1)
    (depleted a2)
    (depleted a3)
    (depleted a4)
    (depleted a5)
    (depleted a6)
    (depleted a7)
    (depleted a8)
    (depleted a9)
    
    ;; final positions for minecars (example)
    (minecar-at carA a1)

    ;; final position for robot
    (robot-at a9)
  ))
)
