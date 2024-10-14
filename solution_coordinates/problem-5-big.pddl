(define (problem pb5)

    (:domain rescue-drone)

    (:objects
        P1 P2 P3 P4 P5 S1 S2 S3 S4
    )

    (:init
        (position P1)
        (position P2)
        (position P3)
        (position P4)
        (position P5)

        (inc P1 P2)
        (inc P2 P3)
        (inc P3 P4)
        (inc P4 P5)

        (safe-zone P5 P5)

        (spot S1)
        (spot S2)
        (spot S3)
        (spot S4)

        (free-spot S1)
        (free-spot S2)
        (free-spot S3)
        (free-spot S4)

        (person-location P3 P1)
        (person-location P2 P2)
        (person-location P2 P3)
        (person-location P1 P4)
        (person-location P5 P4)
        (person-location P4 P5)

        (obstacle P2 P1)
        (obstacle P5 P1)
        (obstacle P4 P2)
        (obstacle P3 P3)
        (obstacle P1 P5)

        (drone-location P1 P3)
        (empty-drone)
    )

    (:goal
        (and
            (not (person-location P3 P1))
            (not (person-location P2 P2))
            (not (person-location P2 P3))
            (not (person-location P1 P4))
            (not (person-location P5 P4))
            (not (person-location P4 P5))
            (person-location P5 P5)
            (empty-drone))
    )
)