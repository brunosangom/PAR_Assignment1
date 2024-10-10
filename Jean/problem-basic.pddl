(define (problem rescue-drone-problem)
  (:domain rescue-drone)

  ;; Declare objects (locations and persons)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 ; Three locations
    p1 p2; One person
    )

  ;; Define the initial state
  (:init
    (drone-location d1) ; The drone starts at location d1
    (person-location p1 d2) ; The person p1 is stranded at location d2
    (person-location p2 d9)
    (safe-zone d3) ; Location d3 is the safe zone

    ;; Define adjacencies for a 3x3 grid
    (adjacent d1 d2)
    (adjacent d1 d4)

    (adjacent d2 d1)
    (adjacent d2 d3)
    (adjacent d2 d5)

    (adjacent d3 d2)
    (adjacent d3 d6)

    (adjacent d4 d1)
    (adjacent d4 d5)
    (adjacent d4 d7)

    (adjacent d5 d2)
    (adjacent d5 d4)
    (adjacent d5 d6)
    (adjacent d5 d8)

    (adjacent d6 d3)
    (adjacent d6 d5)
    (adjacent d6 d9)

    (adjacent d7 d4)
    (adjacent d7 d8)

    (adjacent d8 d5)
    (adjacent d8 d7)
    (adjacent d8 d9)

    (adjacent d9 d6)
    (adjacent d9 d8)

    ;; safe-zone capacity
    (= (safe-zone-capacity-limit) 2) ; Safe zone can hold m=n-1 person, where n is the number of row or column (here n=3)
    (= (safe-zone-capacity-count) 0) ; Currently, no one is in the safe zone
  )

  ;; Define the goal state
  (:goal
    (and
      (rescued p1) ; The goal is to have person p1 rescued
      (rescued p2)
    )
  )
)