# encoding: utf-8

module Irrgarten
    class LabyrinthCharacter
        def initialize(name, intelligence, strength, health)
            @name = name
            @intelligence = intelligence
            @strength = strength
            @health = health
            @row = -1
            @col = -1
        end

        def dead
            @health <= 0
        end

        def get_row
            @row
        end

        def get_col
            @col
        end

        def get_intelligence
            @intelligence
        end
            
        def get_strength
            @strength
        end
            
        def get_health
            @health
        end

        def set_health(health)
            @health = health
        end

        def set_pos(row, col)
            @row = row
            @col = col
        end

        def to_s
            "  #{@name}:\n" +
            "  Intelligence: #{@intelligence}\n" +
            "  Strength: #{@strength}\n" +
            "  Health: #{@health}\n" +
            "  Position: (#{@row}, #{@col})\n" +
        end

        def got_wounded
            @health -= 1
        end

        def attack
        end

        def defend(received_attack)
        end
        
        protected :get_intelligence, :get_strength, :get_health, :set_health, :got_wounded
    end
end
