#encoding: utf-8
module Irrgarten
	class Labyrinth
		BLOCK_CHAR = 'X'
		EMPTY_CHAR = '-'
		MONSTER_CHAR = 'M'
		COMBAT_CHAR = 'C'
		EXIT_CHAR = 'E'
		
		def initialize(n_rows, n_cols, exit_row, exit_col)
			@@ROW = 0
			@@COL = 1
			@labyrinth = Array.new(n_rows){Array.new(n_cols){EMPTY_CHAR}}
			@players = Array.new(n_rows){Array.new(n_cols){nil}}
			@monsters = Array.new(n_rows){Array.new(n_cols){nil}}
			@labyrinth[exit_row][exit_col] = EXIT_CHAR
			@n_rows, @n_cols, @exit_row, @exit_col = n_rows, n_cols, exit_row, exit_col
		end
		
		def have_a_winner
			output = false
			for i in 0..(@n_rows-1) do
				for j  in 0..(@n_cols-1) do
					if @players[i][j] != nil
						player = @players[i][j]
						if exit_pos(player.get_row, player.get_col)
							return true
						end
					end
				end
			end
			output
		end
		
		def pos_OK(row, col)
			return (0 <= row && row < @n_rows && 0 <= col && col < @n_cols)
		end
		
		def empty_pos(row, col)
			return (pos_OK(row, col) && @labyrinth[row][col] == EMPTY_CHAR)
		end
		
		def exit_pos(row, col)
			return (pos_OK(row, col) && @labyrinth[row][col] == EXIT_CHAR)
		end
		
		def monster_pos(row, col)
			return (pos_OK(row, col) && @labyrinth[row][col] == MONSTER_CHAR) 
		end
		
		def combat_pos(row, col)
			return (pos_OK(row, col) && @labyrinth[row][col] == COMBAT_CHAR) 
		end
		
		def can_step_on(row, col)
			return(pos_OK(row, col) && (empty_pos(row, col) || exit_pos(row, col) || monster_pos(row, col)))
		end
		
		def to_s
			output = ""
			for i in 0..(@n_rows-1) do
				for j  in 0..(@n_cols-1) do
					output += @labyrinth[i][j]
				end
				output += '\n'
			end
			output
		end
		
		def add_monster(row, col, monster)
			@labyrinth[row][col] = MONSTER_CHAR
			@monsters[row][col] = monster
			monster.set_pos(row, col)
		end
		
		def update_old_pos(row, col)
			if pos_OK(row, col)
				if @labyrinth[row][col] == COMBAT_CHAR
					@labyrinth[row][col] = MONSTER_CHAR
				else
					@labyrinth[row][col] = EMPTY_CHAR
				end
			end
		end
		
		def dir_2_pos(row, col, direction)
			case direction
				when Directions::LEFT
					[row, col - 1]
				when Directions::RIGHT
					[row, col + 1]
				when Directions::UP
					[row - 1, col]
				when Directions::DOWN
					[row + 1, col]
			end
		end
		
		def random_empty_pos
			pos = [-1,-1]
			until empty_pos(pos[0], pos[1])
				pos = [Dice.random_pos(@n_rows), Dice.random_pos(@n_cols)]
			end
			pos
		end
		
		def spread_players(players)
		end
		
		def put_player(direction, player)
		end
		
		def add_block(orientation, start_row, start_col, length)
		end
		
		def valid_moves(row, col)
		end
		
		def put_player_2D
		end
		
		private :pos_OK, :empty_pos, :exit_pos, :monster_pos, :combat_pos, :can_step_on, :random_empty_pos, :update_old_pos, :dir_2_pos, :put_player_2D
	end
end
