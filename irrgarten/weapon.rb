# encoding: utf-8

module Irrgarten
  class Weapon < CombatElement
      def initialize(power, uses)  
          super(power, uses)
      end

      def attack
          produce_effect
      end
      
      def to_s
      	  return "W" + super
      end
  end
end
