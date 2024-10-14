(define (domain rescue-drone)

    (:requirements :strips :negative-preconditions)

    (:predicates
        (drone-location ?d) ; Represents that the drone is at location ?d
        (person-location ?p ?d) ; Represents that the person ?p is at location ?d
        (obstacle ?d) ; Represents that there is an obstacle at location ?d
        (safe-zone ?d) ; Represents that location ?d is the safe zone
        (adjacent ?d1 ?d2) ; Represents that locations ?d1 and ?d2 are adjacent
        (rescued ?p) ; Represents that the person p has been rescued and is now in the safe zone
        (on-drone ?p) ; Represents that the person p is on the drone
        (drone-occupied); represents that the drone is currently carrying someone
        (spot ?s) ; Represents a valid spot in the safe zone
        (free-spot ?s) ; Represents that the spot ?s in the safe zone is free
    )

    (:action move
        :parameters (?d1 ?d2)

        :precondition (and
            (adjacent ?d1 ?d2)
            (not (obstacle ?d2))
            (drone-location ?d1)
        )

        :effect (and
            (drone-location ?d2)
            (not (drone-location ?d1))
        )
    )

    (:action pick-up
        :parameters (?p ?d)

        :precondition (and
            (person-location ?p ?d)
            (not (rescued ?p))
            (drone-location ?d)
            (not (drone-occupied))
        )

        :effect (and
            (on-drone ?p)
            (not (person-location ?p ?d))
            (drone-occupied)
        ) ; Note the we don't consider the person position to be d after being picked up.
    )

    (:action drop-off
        :parameters (?p ?sd ?s) ; sd for safe-zone position, s for spot

        :precondition (and
            (on-drone ?p)
            (safe-zone ?sd)
            (drone-location ?sd)
            (free-spot ?s)
            (spot ?s)
        )

        :effect (and
            (rescued ?p)
            (not (on-drone ?p))
            (not (drone-occupied))
            (not (free-spot ?s))
        )
    )

    ; Free a spot in the safe zone
    (:action free-safe-zone
        :parameters (?s)

        :precondition (and
            (not (free-spot ?s))
            (spot ?s)
        )

        :effect (free-spot ?s)
    )
)