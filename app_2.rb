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
	hero = gets.chomp
	@user = HumanPlayer.new("#{hero}")

	@players = []
	@player1 = Player.new("Josiane")
	@player2 = Player.new("José")
	@players << @player1 << @player2
end


def key # On définit une méthode qui permet de récupérer les choix du joueur
	press_key = gets.chomp
	if press_key == "a"
		puts "\nTu cherches une arme"
		puts "=======================\n"
		@user.search_weapon
	elsif press_key == "s"
		puts "\nTu cherches un pack de vie"
		puts "=======================\n"
		@user.search_health_pack
	elsif press_key == "0"
		puts "\nTu attaques Josianne"
		puts "=======================\n"
		@user.attacks(@player1)
	elsif press_key == "1"
		puts "\nTu attaques José"
		puts "=======================\n"
		@user.attacks(@player2)
	end
end

def gameplay # On définit une méthode englobant tout le gamplay

	while @user.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0)
		@user.show_state
		@players.each do |stat|
			stat.show_state
		end

		puts "\n\nQuelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"

		puts "Attaquer un joueur en vue :\n\n"
		puts "0 - Josiane a 10 points de vie"
		puts "1 - José a 10 points de vie"

		key # On appelle notre méthode pour faire les choix à chaque tours de boucle

		puts "\nLes autres joueurs t'attaquent !"
		puts "=================================\n"
		@players.each do |attaque| # Chaque bot attaque le joueur


			if attaque.life_points <= 0 # Si les hp égal 0 ou moins, le bot n'attaque plus
				attaque.life_points = 0  # On évite d'avoir des hp négatifs quand les bots sont morts
				break
			end
			attaque.attacks(@user) # On appelle la méthode qui fait prendre les dégats au héros
		end
	end

# Ici on sort de la boucle while quand les conditions sont réunies pour afficher le GAME OVER
	puts "La partie est finie !"
	if @user.life_points <= 0
		puts " LOOSER, t'es une merde, t'as perdu !"
	else puts "BRAVO, TU AS GAGNÉ ! \nT'as éclaté José et Josiane !"
	end
end

# Un petit perform pour la forme  ! 
def perform
	game_menu
	gameplay
end
perform