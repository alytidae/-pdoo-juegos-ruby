# encoding: utf-8

module Irrgarten
    MAX_WEAPONS = 2
    MAX_SHIELDS = 3
    INITIAL_HEALTH = 10
    HITS_TO_LOSE = 3

    class Player
        def initialize(number, intelligence, strength)
            @number = number
            @name = "Player #" + number.to_s()
            @intelligence = intelligence
            @strength = strength
            @health = INITIAL_HEALTH
            #TODO: What should i put in row and col?
            @row = 0
            @col = 0
            @consecutive_hits = 0
            @weapons = []
            @shields = []
        end

        def resurrect
            @weapons = []
            @shields = []
            @health = INITIAL_HEALTH
            @consecutive_hits = 0
        end

        def get_row
            @row
        end

        def get_col
            @col
        end
            
        def get_number
            @number
        end

        def set_pos(row, col)
            @row = row
            @col = col
        end
        
        def dead
            @health <= 0
        end
        
        def move(direction, validMoves)
            #TODO: Complete it, but not in the second practice
            nil
        end

        def attack
            @strength + sum_weapons
        end

        def defend(received_attack)
            #TODO: From docs: Este método delega su funcionalidad en el método manageHit
            nil
        end

        def receive_reward
            #TODO: Complete it, but not in the second practice
            nil
        end

        def to_s
            "Player #{@name}:\n" +
            "  Health: #{@health}\n" +
            "  Position: (#{@row}, #{@col})\n" +
            "  Consecutive Hits: #{@consecutive_hits}\n" +
        end

        def receive_weapon(weapon)
            nil
        end

        def receive_shield(s)
            nil
        end

        def new_weapon
            weapon_power = Dice.weapon_power
            weapon_uses = Dice.uses_left
            Weapon.new(weapon_power, weapon_uses)
        end

        def new_shield
            shield_power = Dice.shield_power
            shield_uses = Dice.uses_left
            Shield.new(shield_power, shield_uses)
        end

        def sum_weapons
            res = 0
            @weapons.each{|x| res += x}
            res
        end

        def sum_shields
            # What the difference between this method and defend?
        end

        def defensive_energy
            res = @intelligence
            @shields.each{|x| res += x}

            res
        end

        def manage_hit(received_attack)
            #TODO: Complete it, but not in the second practice
            nil
        end

        def reset_hits
            @consecutive_hits = 0
        end

        def got_wounded
            @health -= 1
        end

        def inc_consecutive_hits
            @consecutive_hits += 1
        end
    end
end
