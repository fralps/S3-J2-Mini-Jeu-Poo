require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def game_menu # On définit une methode pour l'affichage du menu
	puts"------------------------------------------------"
	puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
	puts "|Le but du jeu est d'être le dernier survivant !|"
	puts "-------------------------------------------------"

	puts "Veuillez entre votre nom héroïque !"
	print "> "
end

def perform #on définit la méthode qui exécute tout
	 game_menu
	 my_game = Game.new(gets.chomp)

	 while my_game.is_still_going? #le while permet de faire tourner 
	 															 #en boucle les différentes méthodes
	 															 #tant que is_still_going? return true
	 	my_game.show_players
	 	my_game.menu
	 	my_game.ennemies_attack
	 end

	 my_game.end									# affiche la fin de partie quand le while
	 															# return false

	end

perform


