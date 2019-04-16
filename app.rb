require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 &&  player2.life_points > 0

	puts "\nVoici l'état de chaque joueur :"
	puts "==============================\n"
	player1.show_state
	player2.show_state

	puts "\nON VA SE FOUTRE SUR LA GUEULE !"
	puts "==============================\n"

	player1.attacks(player2)
	if player2.life_points <= 0 
		break
	end
	player2.attacks(player1)
end