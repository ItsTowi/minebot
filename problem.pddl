(define (problem minerob-example-3x3)
  (:domain minerob)

  (:objects
    a11 a12 a13 a21 a22 a23 a31 a32 a33 - area
    car1 car2 - minecar
  )

  ;; initial state
  (:init
    ;; adjacency (grid 3x3)
    ;; row 1
    (adjacent a11 a12) (adjacent a12 a11)
    (adjacent a12 a13) (adjacent a13 a12)
    (adjacent a21 a22) (adjacent a22 a21)
    (adjacent a22 a23) (adjacent a23 a22)
    (adjacent a31 a32) (adjacent a32 a31)
    (adjacent a32 a33) (adjacent a33 a32)

    (adjacent a11 a21) (adjacent a21 a11)
    (adjacent a12 a22) (adjacent a22 a12)
    (adjacent a13 a23) (adjacent a23 a13)
    (adjacent a21 a31) (adjacent a31 a21)
    (adjacent a22 a32) (adjacent a32 a22)
    (adjacent a23 a33) (adjacent a33 a23)

    ;; robot start
    (robot-at a11)

    ;; minecars initial positions
    (minecar-at car1 a22)
    (not (minecar-at car2 a11))   ;; explicit negative preconds are optional; we rely on empty facts
    (minecar-at car2 a13)

    ;; empty bookkeeping: any cell with no minecar must be declared empty
    (empty a11) (not (empty a22)) (not (empty a13))
    (empty a12) (empty a21) (empty a23) (empty a31) (empty a32) (empty a33)

    ;; minerals (some cells have minerals)
    (minerals a12)
    (minerals a22)
    (minerals a33)
    ;; others are depleted/without minerals (you may add depleted facts if needed)
  )

  ;; goal: all minerals collected (depleted) and specific final minecar positions
  (:goal (and
    (depleted a12)
    (depleted a22)
    (depleted a33)

    ;; final positions for minecars (example)
    (minecar-at car1 a23)
    (minecar-at car2 a13)
  ))
)
