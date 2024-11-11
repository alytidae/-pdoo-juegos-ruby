# encoding: utf-8

require_relative '../irrgarten/irrgarten'
require_relative '../controller/controller'
require_relative '../ui/textUI'

include Irrgarten
include UI
include Control

module Main
    class IrregartenProgram
        def self.main(args)
          if args.length == 0
            @n_players = 1;            
          else
            n_players = args[0].to_i
          end

          ui = textUI.initialize()
          game = game.initialize()
          ctrlr = controller(game, ui);
          ctrlr.play()
        end
    end
end



