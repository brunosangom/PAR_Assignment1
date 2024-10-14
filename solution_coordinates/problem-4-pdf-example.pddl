(define (problem pb4)

    (:domain rescue-drone)

    (:objects
        P1 P2 P3 P4 S1 S2 S3
    )

    (:init
        (position P1)
        (position P2)
        (position P3)
        (position P4)

        (inc P1 P2)
        (inc P2 P3)
        (inc P3 P4)

        (safe-zone P2 P4)

        (spot S1)
        (spot S2)
        (spot S3)

        (free-spot S1)
        (free-spot S2)
        (free-spot S3)

        (person-location P4 P1)
        (person-location P1 P2)
        (person-location P2 P3)

        (obstacle P3 P2)
        (obstacle P3 P3)
        (obstacle P4 P4)

        (drone-location P1 P1)
        (empty-drone)
    )

    (:goal
        (and
            (not (person-location P4 P1))
            (not (person-location P1 P2))
            (not (person-location P2 P3))
            (person-location P2 P4)
            (empty-drone))
    )
)