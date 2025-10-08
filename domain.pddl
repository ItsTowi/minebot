(define (domain minerob)
  (:requirements :strips :typing :negative-preconditions :equality :adl)

  (:types area minecar)

  (:predicates
    (robot-at ?a - area)                    ;; robot is located at area ?a
    (minecar-at ?m - minecar ?a - area)     ;; minecar ?m is at area ?a
    (minerals ?a - area)                    ;; area ?a contains minerals
    (depleted ?a - area)                    ;; area ?a has been depleted (no minerals)
    (empty ?a - area)                       ;; there is no minecar in area ?a
    (adjacent ?a1 - area ?a2 - area)        ;; adjacency (horizontal/vertical)
  )

  ;; MOVE: robot walks from one area to an adjacent area.
  ;; Precondition: destination must be empty of minecars.
  (:action move
    :parameters (?from - area ?to - area)
    :precondition (and
      (robot-at ?from)
      (adjacent ?from ?to)
      (empty ?to)                            ;; cannot step into a minecar
    )
    :effect (and
      (not (robot-at ?from))
      (robot-at ?to)
    )
  )

  ;; COLLECT: robot drills and collects minerals in current area.
  (:action collect
    :parameters (?a - area)
    :precondition (and
      (robot-at ?a)
      (minerals ?a)
    )
    :effect (and
      (not (minerals ?a))
      (depleted ?a)
    )
  )

  ;; PUSH: robot pushes a minecar forward.
  ;; Semantics chosen: robot stands *behind* the minecar, pushes the minecar from its current cell into the next cell.
  ;; Precond: robot adjacent to minecar source cell, the target cell (where the minecar will go) is adjacent to the minecar cell and is empty.
  ;; Effects: robot moves into the minecar's old cell, minecar moves into the target cell;
  ;;          minecar's old cell becomes empty, the target cell becomes non-empty.
  (:action push
    :parameters (?rpos - area ?m - minecar ?mcpos - area ?target - area)
    :precondition (and
      (robot-at ?rpos)
      (minecar-at ?m ?mcpos)
      (adjacent ?rpos ?mcpos)                ;; robot is adjacent to minecar
      (adjacent ?mcpos ?target)              ;; target is adjacent to minecar cell
      (empty ?target)                         ;; target must be free of minecars
    )
    :effect (and
      ;; robot moves into minecar's old position
      (not (robot-at ?rpos))
      (robot-at ?mcpos)

      ;; minecar moves from mcpos to target
      (not (minecar-at ?m ?mcpos))
      (minecar-at ?m ?target)

      ;; empty predicate bookkeeping
      (empty ?mcpos)                          ;; old minecar cell becomes empty
      (not (empty ?target))                   ;; new minecar cell becomes non-empty
    )
  )
)
