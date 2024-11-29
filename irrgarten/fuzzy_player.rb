module Irrgarten
	class FuzzyPlayer < Player
		def initialize(player)
			copy(player) #TODO: need to implement copy method in Player and LabyrinthCharacter
		end
		
		def move(direction, valid_moves)
			ideal_move = super
			return Dice.next_step(ideal_move, valid_moves, @intelligence)
		end
		
		def attack
			return Dice.intensity(@strength) + sum_weapons
		end
		
		def defensive_energy
			return Dice.intensity(@intelligence) + sum_shields
		end
		
		def to_s
			return "FUZZY " + super
		end
		
		protected :defensive_energy
	end
end
