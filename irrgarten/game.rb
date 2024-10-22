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
            # TODO: Complete later in the next practice
            throw NotImplementedError.new("This method will be implemented in the next practice")
        end

        def combar(monster)
            # TODO: Complete later in the next practice
            throw NotImplementedError.new("This method will be implemented in the next practice")
        end

        def manage_reward(winner)
            # TODO: Complete later in the next practice
            throw NotImplementedError.new("This method will be implemented in the next practice")
        end

        def manage_resurrection
            # TODO: Complete later in the next practice
            throw NotImplementedError.new("This method will be implemented in the next practice")
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
    end
end
