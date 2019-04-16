require "pry"

# On crée notre class Player
class Player
	attr_accessor :name, :life_points # On veut un nom de joueur et son nombre de pv

	# On initialise les joueurs avec un nom et un nombre de pv dès le lancement du programme
	def initialize(name)
		@name = name
		@life_points = 10
	end

	# On affiche les pv actuels du joueur
	def show_state
		puts "#{@name} a #{@life_points} points de vie."
	end

	# On soustrait les pv actuels avec les dégâts causés aléatoire dans compute_damage
	def gets_damage(dmg)
		@life_points = @life_points - dmg

		# Si les pv sont inférieurs ou égaux à 0 on affiche la mort du joueur :'(
		if @life_points <= 0
			puts "Le joueur #{@name} est mort comme une merde!"
		end
	end

	def attacks(player_name)
		variable = compute_damage
		puts "Le joueur #{@name} attaque #{player_name.name}." # Description des actions

		# On acitve la méthode gets_damage pour le joueur passé en paramètre de attacks,
		# et on passe en paramètre de gets_damage le résultat de compute_damage (rand...)
		player_name.gets_damage(variable) 
		puts "Il lui inflige #{variable} points de dégâts." # Description des actions
	end

	# Méthode qui va prendre un chiffre au hasard entre 1 et 6 
	def compute_damage
		return rand(1..6)
	end
end