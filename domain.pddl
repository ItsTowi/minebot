(define (domain minerob)
  (:requirements :strips :typing :negative-preconditions :equality :adl)

  (:types area minecar)

  (:predicates
    (robot-at ?a - area)             ; robot is located at area ?a
    (minecar-at ?m - minecar ?a - area); minecar ?m is at area ?a
    (minerals ?a - area)                ; area ?a contains minerals
    (depleted ?a - area)                    ; area ?a has been depleted (no minerals)
    (empty ?a - area)                ; there is no minecar in area ?a
    (adjacent ?a1 - area ?a2 - area)        ; adjacency (horizontal/vertical)
  )

  ; MOVE: robot walks from one area to an adjacent area.
  (:action move
    :parameters (?from - area ?to - area)
    :precondition (and
      (robot-at ?from)                          ; robot at area
      (adjacent ?from ?to)                      ; destination its adjacent to "from"
    )
    :effect (and
      (not (robot-at ?from))                    ; from has no robot
      (robot-at ?to)                            ; robot at destination
    )
  )

  ; COLLECT: robot drills and collects minerals in current area. where there is not robot and it has minerals
  (:action collect
    :parameters (?a - area)
    :precondition (and
      (robot-at ?a)                            ; robot at the cell
      (minerals ?a)                            ; minerals at the cell
      (empty ?a)                               ; not minecart into to collect
    )
    :effect (and
      (not (minerals ?a))                      ;depleted area
      (depleted ?a)
    )
  )

  ; PUSH: robot pushes a minecar forward.
  ; Semantics chosen: robot stands in the minecar cell , pushes the minecar from its current cell into the next cell.
  ; Precond: robot in minecar source cell, the target cell (where the minecar will go) is adjacent to the minecar cell and is empty.
  ; Effects: minecar moves into the target cell;
  ;          minecar's old cell becomes empty, the target cell becomes non-empty.
  (:action push
    :parameters (?m - minecar ?mcpos - area ?target - area)
    :precondition (and
      (robot-at ?mcpos)                       ; robot at minecart position
      (minecar-at ?m ?mcpos)                  ; minecart at position
      (adjacent ?mcpos ?target)               ; target is adjacent to minecar cell
      (empty ?target)                         ; target must be free of minecars
    )
    :effect (and
      ;; minecar moves from mcpos to target
      (not (minecar-at ?m ?mcpos))            ; minecar leaves last position
      (minecar-at ?m ?target)                 ; minecar at the target

      ;; empty predicate bookkeeping
      (empty ?mcpos)                          ; old minecar cell becomes empty
      (not (empty ?target))                   ; new minecar cell becomes non-empty
    )
  )
)
