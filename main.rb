module GameCharacter
    PLAYER  = :player
    MONSTER = :monster
end

module Directions
    LEFT  = :left
    RIGHT = :right
    UP    = :up
    DOWN  = :down
end

module Orientation
    VERTICAL   = :vertical
    HORIZONTAL = :horizontal
end

class Weapon
    def initialize(power, uses)  
        @power = power
        @uses = uses
    end

    def attack
        if @uses > 0
            @uses -= 1
            return @power
        end
        return 0
    end

    def to_s
        "W[#{@power}, #{@uses}]"
    end
end

w = Weapon.new(10, 5)
puts w.to_s
