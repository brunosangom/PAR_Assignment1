(define (domain rescue-drone)

  (:requirements :strips :fluents :negative-preconditions)

  (:predicates
    (drone-location ?d) ; Represents that the drone is at location ?d
    (person-location ?p ?d) ; Represents that the person ?p is at location ?d
    (obstacle ?d) ; Represents that there is an obstacle at location ?d
    (safe-zone ?d) ; Represents that location ?d is the safe zone
    (adjacent ?d1 ?d2) ; Represents that locations ?d1 and ?d2 are adjacent
    (rescued ?p) ; Represents that the person p has been rescued and is now in the safe zone
    (on-drone ?p) ; Represents that the person p is on the drone
    (drone-occupied); represents that the drone is currently carrying someone
  )

  (:functions
    (safe-zone-capacity-count) ; Current number of people in the safe zone
    (safe-zone-capacity-limit) ; Maximum number of people allowed in the safe zone
  )

  (:action move
    :parameters (?d1 ?d2)
    :precondition (and (adjacent ?d1 ?d2) (not (obstacle ?d2)) (drone-location ?d1))
    :effect (and (drone-location ?d2) (not (drone-location ?d1)))
  )

  (:action pick-up
    :parameters (?p ?d)
    :precondition (and (person-location ?p ?d) (not (rescued ?p)) (drone-location ?d) (not (drone-occupied)))
    :effect (and (on-drone ?p) (not (person-location ?p ?d)) (drone-occupied)) ; Note the we don't consider the person position to be d after being picked up.
  )

  (:action drop-off
    :parameters (?p ?sd) ; sd for safe-zone position
    :precondition (and (on-drone ?p) (safe-zone ?sd) (drone-location ?sd) (< (safe-zone-capacity-count) (safe-zone-capacity-limit)))
    :effect (and (increase (safe-zone-capacity-count) 1) (rescued ?p) (not (on-drone ?p)) (not (drone-occupied)))
  )

  ; Free a spot in the safe zone
  (:action free-safe-zone
    :parameters (?sd)
    :precondition (and (safe-zone ?sd) (> (safe-zone-capacity-count) 0))
    :effect (and (decrease (safe-zone-capacity-count) 1))
  )
  
)