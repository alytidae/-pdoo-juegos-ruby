# encoding: utf-8

module Irrgarten
    MAX_ROUNDS = 10

    class Game
        def initialize(nplayers)
            @current_player_index = 0
            @log = ""  
            @monsters = []  

			#TODO: Decide what value put here.
            @labyrinth = Labyrinth.new(10, 10, 9, 9)
            @players = []  

            nplayers.times do |i|
                @players << Player.new(i + 1, Dice.random_intelligence, Dice.random_strength)
            end

            @current_player = @players[@current_player_index]  

			configure_labyrinth
			spread_players
        end

        def finished
			@labyrinth.have_a_winner
        end

        def get_game_state
            GameState.new(@labyrinth, @players, @monsters, @current_player_index, finished, @log)
        end

        def configure_labyrinth
            # TODO: Complete later in the next practice
            throw NotImplementedError.new("This method will be implemented in the next practice")
        end

        def next_player
            @current_player_index = (@current_player_index + 1) % @players.size
            @current_player = @players[@current_player_index]
        end

        def actual_direction(preferred_direction)
            current_row = @current_player.get_row
            current_col = @current_player.get_col
            valid_moves = @labyrinth.valid_moves(current_row, current_col)
            return (@current_player.move(preferred_direction, valid_moves))
        end

        def combat(monster)
            rounds = 0
            winner = GameCharacter::PLAYER
            player_attack = @current_player.attack
            lose = monster.defend(player_attack)
            while(!lose && rounds < MAX_ROUNDS) do
            	winner = GameCharacter::MONSTER
            	rounds += 1
            	monster_attack = monster.attack
            	lose = @current_player.defend(monster_attack)
            	if !lose then
            		player_attack = @current_player.attack
            		winner = GameCharacter::PLAYER
            		lose = @monster.defend(player_attack)
            	end
            end
            log_rounds(rounds, MAX_ROUNDS)
            return winner
        end

        def manage_reward(winner)
            if winner == GameCharacter::PLAYER
            	@current_player.receive_reward
            	log_player_won
            else
            	log_monster_won
            end
        end

        def manage_resurrection
            resurrect = Dice.resurrect_player
            if resurrect then
            	@current_player.resurrect
            	log_resurrected
            else
            	log_player_skip_turn
            end
        end
		
		def next_step(preferred_direction)
			@log = ""
			dead = @current_player.dead
			if !dead then
				direction = actual_direction(preferred_direction)
				if direction != preferred_direction then
					log_player_no_orders
				end
				monster = @labyrinth.put_player(direction, @current_player)
				if monster == nil then
					log_no_monster
				else
					winner = combat(monster)
					manage_reward(winner)
				end
			else
				manage_resurrection
			end
			end_game = finished
			if !end_game then
				next_player
			end
			return end_game
		end
		
        def log_player_won
            @log += "Player #{@current_player.get_number} won!\n"
        end

        def log_monster_won
            @log += "Monsters won!\n"
        end

        def log_resurrected
            @log += "Player #{@current_player.get_number} resurrected.\n"
        end

        def log_player_skip_turn
            @log += "Player #{@current_player.get_number} skipped the turn (dead).\n"
        end

        def log_player_no_orders
            @log += "Player #{@current_player.get_number} has not followed the instructions of the human player (it was not possible).\n"
        end

        def log_no_monster
            @log += "Player #{@current_player.get_number} has moved to an empty cell or has not been able to move.\n"
        end

        def log_rounds(rounds, max)
            @log += "#{rounds} rounds of #{max} rounds of combat have occurred.\n"
        end
        
        private :configure_labyrinth, :next_player, :actual_direction, :combat, :manage_reward, :manage_resurrection, :log_player_won, :log_monster_won, :log_resurrected, :log_player_skip_turn, :log_player_no_orders, :log_no_monster, :log_rounds
    end
end
