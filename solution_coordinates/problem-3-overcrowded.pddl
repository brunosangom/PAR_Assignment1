(define (problem pb3)

    (:domain rescue-drone)

    (:objects
        P1 P2 P3 S1 S2
    )

    (:init
        (position P1)
        (position P2)
        (position P3)

        (inc P1 P2)
        (inc P2 P3)

        (safe-zone P3 P1)

        (spot S1)
        (spot S2)

        (free-spot S1)
        (free-spot S2)

        (person-location P2 P1)
        (person-location P1 P2)
        (person-location P3 P3)

        (drone-location P1 P1)
        (empty-drone)
    )

    (:goal
        (and
            (not (person-location P2 P1))
            (not (person-location P3 P3))
            (not (person-location P1 P2))
            (person-location P3 P1)
            (empty-drone))
    )
)