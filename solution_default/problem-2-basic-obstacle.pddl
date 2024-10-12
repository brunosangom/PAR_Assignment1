(define (problem rescue-drone-problem)
  (:domain rescue-drone)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 ; Locations
    p1 p2 ; Persons
    s1 s2 ; Spots
    )

  (:init
    (drone-location d1)
    (person-location p1 d2)
    (person-location p2 d9)
    (safe-zone d3)

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

    ;; Obstacles
    (obstacle d6)

    ;; Safe-zone spots
    (spot s1)
    (spot s2)
    (free-spot s1)
    (free-spot s2)
  )

  (:goal
    (and
      (rescued p1)
      (rescued p2)
    )
  )
)