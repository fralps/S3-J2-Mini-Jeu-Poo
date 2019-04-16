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
		puts "Il lui a infligé #{variable} points de dégâts.\n\n" # Description des actions

		# On active la méthode gets_damage pour le joueur passé en paramètre de attacks,
		# et on passe en paramètre de gets_damage le résultat de compute_damage (rand...)
		player_name.gets_damage(variable) 
	end

	# Méthode qui va prendre un chiffre au hasard entre 1 et 6 
	def compute_damage
		return rand(1..6)
	end
end

# Deuxième classe pour notre v2
class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		super(name) # On met le super avant d'initialiser les pv du héros sinon ça les remet à 10.
		@life_points = 100
		@weapon_level = 1 # On initialise le weapon level
	end

	# On modifie notre show_state pour qu'il s'applique seulement à notre héros
	def show_state
		puts "=============== Stat des joueurs ================="
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
	end

	# On mulitplie les dégâts par le weapon level
	def compute_damage
		rand(1..6) * @weapon_level
	end

	# En fonction du weapon level on prend ou pas la nouvelle arme
	def search_weapon
		@weapon =  rand(1..6)
		puts "Tu as trouvé une arme de niveau #{@weapon}"
		if @weapon <= @weapon_level # Si le niveau est inférieur ou égal au niveau de l'ancienne arme, on garde l'ancienne.
			puts " M@*#$ l'arme trouvée est vraiment bidon, tu gardes l'ancienne"
		else 
			puts "De la frappe frere !\n\n"
			@weapon_level = @weapon # Si meilleure arme, on la prend
		end
	end

	def search_health_pack
		puts @health_pack = rand(1..6)
		if @health_pack == 1
			puts "Tu n'as rien trouvé, zgegou"
		elsif @health_pack >= 2 && @health_pack <= 5
			puts "Bravo, t'as trouvé un pack de +50 pv ma poule !"
			@life_points += 50
			if @life_points > 100
				@life_points = 100 # Si les points de vie dépassent 100, on rétablit les pv à 100
			end

		else puts "Wahou, tu as trouvé un pack de +80 pv, c'te luck !"
			@life_points += 80
			if @life_points > 100
				@life_points = 100 # Idem
			end
		end
	end
end
