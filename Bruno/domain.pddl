(define (domain rescue-drone)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates (position ?P)          ; P is a valid coordinate position (assuming square grid)
                 (inc ?P ?PP)            ; PP is greater coordinate than P
                 (safe-zone ?X ?Y)       ; The safe zone is at coordinates (X, Y)
                 (obstacle ?X ?Y)        ; There is an obstacle at coordinates (X, Y)
                 (person ?X ?Y)   ; There is a person at coordinates (X, Y)
                 (drone ?X ?Y)    ; The drone is at coordinates (X, Y)
                 (empty-drone)    ; The drone is not carrying a person
                 (spot ?S)               ; S is a valid spot of the safe zone
                 (free-spot ?S)   ; The spot S of the safe zone is free
    )

    (:action up
        :parameters (?X ?Y ?NY) 

        :precondition (and 
                      (position ?X) (position ?Y) (position ?NY) 
                      (inc ?NY ?Y) 
                      (drone ?X ?Y) 
                      (not (obstacle ?X ?NY))
        )

        :effect (and
                (drone ?X ?NY)
                (not (drone ?X ?Y))
        )
    )

    (:action down
        :parameters (?X ?Y ?NY) 

        :precondition (and 
                      (position ?X) (position ?Y) (position ?NY) 
                      (inc ?Y ?NY) 
                      (drone ?X ?Y) 
                      (not (obstacle ?X ?NY))
        )

        :effect (and
                (drone ?X ?NY)
                (not (drone ?X ?Y))
        )
    )

    (:action right
        :parameters (?X ?Y ?NX) 

        :precondition (and 
                      (position ?X) (position ?Y) (position ?NX) 
                      (inc ?X ?NX) 
                      (drone ?X ?Y) 
                      (not (obstacle ?NX ?Y))
        )

        :effect (and
                (drone ?NX ?Y)
                (not (drone ?X ?Y))
        )
    )

    (:action left
        :parameters (?X ?Y ?NX) 

        :precondition (and 
                      (position ?X) (position ?Y) (position ?NX)
                      (inc ?NX ?X) 
                      (drone ?X ?Y) 
                      (not (obstacle ?NX ?Y))
        )

        :effect (and
                (drone ?NX ?Y)
                (not (drone ?X ?Y))
        )
    )

    (:action pick-up
        :parameters (?X ?Y)

        :precondition (and (drone ?X ?Y) (person ?X ?Y) (empty-drone))

        :effect (and (not (person ?X ?Y)) (not (empty-drone)))
    )

    (:action drop-off
        :parameters (?X ?Y ?S)

        :precondition (and 
                      (drone ?X ?Y) (not (empty-drone))
                      (safe-zone ?X ?Y) (spot ?S) (free-spot ?S)
        )

        :effect (and (empty-drone) (person ?X ?Y) (not (free-spot ?S)))
    )

    (:action evacuate-safe-zone
        :parameters (?S)
        :precondition (and (spot ?S) (not (free-spot ?S)))
        :effect (free-spot ?S)
    )
    
    
)