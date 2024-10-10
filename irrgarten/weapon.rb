# encoding: utf-8

module Irrgarten
  class Weapon
      def initialize(power, uses)  
          @power = power
          @uses = uses
      end

      def attack
          if @uses > 0
              @uses -= 1
              return @power
          end
          return 0
      end

      def to_s
          "W[#{@power}, #{@uses}]"
      end
      
      def discard
          return Dice.discard_element(@uses)
      end
  end
end
