# encoding: utf-8

module Irrgarten
	class Shield < CombatElement
		def initialize(protection, uses)
			super(protection, uses)
		end
	
		def protect
			produce_effect
		end
		
		def to_s
			return "S" + super
		end
	end
end
