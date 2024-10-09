# encoding: utf-8

module Irrgarten
		class GameState
				def initialize(labyrinth_string = "", player_string = "", monster_string = "", current_player = 0, winner = false, log_string = "")
						@labyrinth = labyrinth_string
						@players = player_string
						@monsters = monster_string
						@currentPlayer = current_player
						@winner = winner
						@log = log_string
				end
	
				def labyrinth
						@labyrinth
				end

				def players
						@players
				end

				def monsters
						@monsters
				end

				def current_player
						@current_player
				end

				def winner
						@winner
				end

				def log
						@log
				end
		end
end
