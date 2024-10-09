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

class Dice 
    MAX_USES = 5
    MAX_INTELLIGENCE = 10.0
    MAX_STRENGTH = 10.0
    RESURRECT_PROB = 0.3
    WEAPONS_REWARD = 2
    SHIELDS_REWARD = 3
    HEALTH_REWARD = 5
    MAX_ATTACK = 3
    MAX_SHIELD = 2

    @generator = Random.new

    def self.random_pos(max)
        @generator.rand(0...max)
    end

    def self.who_starts(nplayers)
        @generator.rand(0...nplayers)
    end

    def self.random_intelligence
        @generator.rand(0...MAX_INTELLIGENCE)
    end

    def self.random_strength
        @generator.rand(0...MAX_STRENGTH)
    end

    def self.resurrect_player
        @generator.rand < RESURRECT_PROB
    end

    def self.weapons_reward
        @generator.rand(0..WEAPONS_REWARD)
    end

    def self.shields_reward
        @generator.rand(0..SHIELDS_REWARD)
    end

    def self.health_reward
        @generator.rand(0..HEALTH_REWARD)
    end

    def self.weapon_power
        @generator.rand(0...MAX_ATTACK)
    end

    def self.shield_power
        @generator.rand(0...MAX_SHIELD)
    end

    def self.uses_left
        @generator.rand(0..MAX_USES)
    end

    def self.intensity(competence)
        @generator.rand(0...competence)
    end

    def self.discard_element(uses_left)
        return false if uses_left == MAX_USES
        return true if uses_left == 0
        probability = 1 - (uses_left.to_f / MAX_USES)
        @generator.rand < probability
    end
end
