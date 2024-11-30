# encoding: utf-8
module Irrgarten
	class Monster < LabyrinthCharacter
		INITIAL_HEALTH = 5
		@uninitialized_pos = -1

		def initialize(name, intelligence, strength)
			super(name, intelligence, strength, INITIAL_HEALTH)
		end

		def attack
			Dice.intensity(@strength)
		end
		
		def defend(received_attack)
			is_dead = dead
			if (!is_dead)
				defensive_energy = Dice.intensity(@intelligence)
				if(defensive_energy < received_attack)
					got_wounded
					is_dead = dead
				end
			end
			return is_dead
		end

		def to_s
			"Monster" + super
		end

	end
end
