(define (domain rescue-drone)

    (:requirements :strips :equality :negative-preconditions :fluents)

    (:predicates (position ?P)          ; P is a valid coordinate position (assuming square grid)
                 (inc ?P ?PP)            ; PP is greater coordinate than P
                 (safe-zone ?X ?Y)       ; The safe zone is at coordinates (X, Y)
                 (obstacle ?X ?Y)        ; There is an obstacle at coordinates (X, Y)
                 (person ?X ?Y)   ; There is a person at coordinates (X, Y)
                 (drone ?X ?Y)    ; The drone is at coordinates (X, Y)
                 (empty-drone)    ; The drone is not carrying a person
    )

    (:functions (safe-zone-capacity)) ; Maximum amount of people the safe zone can hold

    (:action up
        :parameters (?X ?Y ?NY) 

        :precondition (and (position ?X) (position ?Y) (position ?NY) (inc ?NY ?Y) (drone ?X ?Y) (not (obstacle ?X ?NY)))

        :effect (and
                (drone ?X ?NY)
                (not (drone ?X ?Y)))
    )

    (:action down
        :parameters (?X ?Y ?NY) 

        :precondition (and (position ?X) (position ?Y) (position ?NY) (inc ?Y ?NY) (drone ?X ?Y) (not (obstacle ?X ?NY)))

        :effect (and
                (drone ?X ?NY)
                (not (drone ?X ?Y)))
    )

    (:action right
        :parameters (?X ?Y ?NX) 

        :precondition (and (position ?X) (position ?Y) (position ?NX) (inc ?X ?NX) (drone ?X ?Y) (not (obstacle ?NX ?Y)))

        :effect (and
                (drone ?NX ?Y)
                (not (drone ?X ?Y)))
    )

    (:action left
        :parameters (?X ?Y ?NX) 

        :precondition (and (position ?X) (position ?Y) (position ?NX) (inc ?NX ?X) (drone ?X ?Y) (not (obstacle ?NX ?Y)))

        :effect (and
                (drone ?NX ?Y)
                (not (drone ?X ?Y)))
    )

    (:action pick-up
        :parameters (?X ?Y)

        :precondition (and (drone ?X ?Y) (person ?X ?Y) (empty-drone))

        :effect (and (not (person ?X ?Y)) (not (empty-drone)))
    )

    (:action drop-off
        :parameters (?X ?Y)

        :precondition (and (drone ?X ?Y) (safe-zone ?X ?Y) (not (empty-drone)) (> (safe-zone-capacity) 0))

        :effect (and (empty-drone) (person ?X ?Y) (decrease (safe-zone-capacity) 1))
    )

    (:action evacuate-safe-zone
        :parameters ()
        :precondition (and (= (safe-zone-capacity) 0))
        :effect (and (increase (safe-zone-capacity) 1))
    )
    
    
)