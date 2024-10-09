# encoding: utf-8

require_relative 'irrgarten/irrgarten'

include Irrgarten

class TestP1
  def self.main
    puts "=== Weapon Test ==="
    weapon_test

    puts "\n=== Shield Test ==="
    shield_test

    puts "\n=== Dice Test ==="
    dice_test

    puts "\n=== GameState Test ==="
    game_state_test
  end

  def self.weapon_test
    weapon = Weapon.new(2.5, 5)
    puts "Created weapon: #{weapon}"
    3.times { puts "Attack: #{weapon.attack}, current state: #{weapon}" }
    puts "Attack with zero uses left: #{weapon.attack}, current state: #{weapon}"
  end

  def self.shield_test
    shield = Shield.new(3.0, 4)
    puts "Created shield: #{shield}"
    2.times { puts "Defense: #{shield.protect}, current state: #{shield}" }
    puts "Defense with zero uses left: #{shield.protect}, current state: #{shield}"
  end

  def self.dice_test
    results = {
      random_pos: Hash.new(0),
      who_starts: Hash.new(0),
      random_intelligence: [],
      random_strength: [],
      resurrect_player: 0,
      weapons_reward: Hash.new(0),
      shields_reward: Hash.new(0),
      health_reward: Hash.new(0),
      weapon_power: [],
      shield_power: [],
      uses_left: Hash.new(0),
      intensity: [],
      discard_element: 0
    }

    100.times do
      results[:random_pos][Dice.random_pos(10)] += 1
      results[:who_starts][Dice.who_starts(4)] += 1
      results[:random_intelligence] << Dice.random_intelligence
      results[:random_strength] << Dice.random_strength
      results[:resurrect_player] += 1 if Dice.resurrect_player
      results[:weapons_reward][Dice.weapons_reward] += 1
      results[:shields_reward][Dice.shields_reward] += 1
      results[:health_reward][Dice.health_reward] += 1
      results[:weapon_power] << Dice.weapon_power
      results[:shield_power] << Dice.shield_power
      results[:uses_left][Dice.uses_left] += 1
      results[:intensity] << Dice.intensity(5.0)
      results[:discard_element] += 1 if Dice.discard_element(Dice.uses_left)
    end

    puts "\nDice Test Results:"
    results.each do |method, result|
      puts "#{method}: #{result}"
    end
  end

  def self.game_state_test
    state = GameState.new("Labyrinth: Sample", "Players: P1, P2", "Monsters: M1", 1, false, "No events yet")
    puts "Labyrinth: #{state.labyrinth}"
    puts "Players: #{state.players}"
    puts "Monsters: #{state.monsters}"
    puts "Current Player Index: #{state.current_player}"
    puts "Winner Exists: #{state.winner}"
    puts "Log: #{state.log}"
  end
end

TestP1.main
