(define (problem pb1)

    (:domain rescue-drone)

    (:objects P1 P2 P3 P4 P5)

    (:init
        (position P1) (position P2) (position P3) (position P4) (position P5)
        (inc P1 P2) (inc P2 P3) (inc P3 P4) (inc P4 P5)
        (safe-zone P5 P5) (= (safe-zone-capacity) 4)
        (obstacle P4 P2) (obstacle P2 P3) (obstacle P4 P4) (obstacle P5 P1)
        (person P2 P2) (person P1 P5) (person P3 P3) (person P4 P1)
        (drone P1 P1) (empty-drone)
        )
    
    (:goal (and (not (person P2 P2)) (not (person P1 P5)) (not (person P3 P3)) (not (person P4 P1)) (person P5 P5) (empty-drone)))
)