# encoding: utf-8

module Irrgarten
		class Gamestate
				def initialize(labyrinthString = "", playerString = "", monsterString = "", currentPlayer = 0, winner = false, logString = "")
						@labyrinth = labyrinthString
						@players = playerString
						@monsters = monsterString
						@currentPlayer = currentPlayer
						@winner = winner
						@log = logString
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

				def currentPlayer
						@currentPlayer
				end

				def winner
						@winner
				end

				def log
						@log
				end
		end
end
