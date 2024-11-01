# encoding: utf-8

module Irrgarten
    MAX_WEAPONS = 2
    MAX_SHIELDS = 3
    INITIAL_HEALTH = 10
    HITS2LOSE = 3

    class Player
        def initialize(number, intelligence, strength)
            @number = number
            @name = "Player #" + number.to_s()
            @intelligence = intelligence
            @strength = strength
            @health = INITIAL_HEALTH
            @row = -1
            @col = -1
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
            size = validMoves.size
            contained = validMoves.include?(direction)
            if (size > 0 && !contained)
            	return validMoves[0]
            else
            	return direction
            end
        end

        def attack
            @strength + sum_weapons
        end

        def defend(received_attack)
            manage_hit(received_attack)
        end

        def receive_reward
            w_reward, s_reward = Dice.weapons_reward, Dice.shields_reward
            for i in 1..w_reward do
            	wnew = new_weapon
            	receive_weapon(wnew)
            end
            for i in 1..s_reward do
            	snew = new_shield
            	receive_shield(snew)
            end
            extra_health = Dice.health_reward
            @health += extra_health
        end

        def to_s
            "Player #{@name}:\n" +
            "  Intelligence: #{@intelligence}\n" +
            "  Strength: #{@strength}\n" +
            "  Health: #{@health}\n" +
            "  Position: (#{@row}, #{@col})\n" +
            "  Consecutive Hits: #{@consecutive_hits}\n" +
            "  Weapons: #{@weapons}\n" +
            "  Shields: #{@shields}\n" +
        end

        def receive_weapon(w)
            @weapons.delete_if{|weapon| weapon.discard}
            if @weapons.size < MAX_WEAPONS
            	@weapons.push(w)
            end
        end

        def receive_shield(s)
            @shields.delete_if{|shield| shield.discard}
            if @shields.size < MAX_SHIELDS
            	@shields.push(s)
            end
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
            @weapons.each{|x| res += x.attack}
            res
        end

        def sum_shields
            res = 0
            @shields.each{|x| res += x.protect}
            res
        end

        def defensive_energy
            @intelligence + sum_shields
        end

        def manage_hit(received_attack)
            defense = defensive_energy
            if defense < received_attack
            	got_wounded
            	inc_consecutive_hits
            else
            	reset_hits
            end
            if (@consecutive_hits == HITS2LOSE or dead)
            	reset_hits
            	return true
            else
            	return false
            end
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
        
        private :receive_weapon, :receive_shield, :new_weapon, :new_shield, :sum_weapons, :sum_shields, :defensive_energy, :manage_hit, :reset_hits, :got_wounded, :inc_consecutive_hits
    end
end
