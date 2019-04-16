require 'pry'

class Game
	attr_accessor :human_player, :enemies

	def initialize(name)# on initialise un utilisateur humain et 4 bots
		@human_player = HumanPlayer.new(name)
		@enemies = [Player.new("zoe"), Player.new("tortue"), Player.new("gros connard"), Player.new("trouduc")]
	end

	def kill_player(player_to_kill) #fonction qui a pour but de supprimer les ennemis du tableau qui les contient
		@enemies.delete(player_to_kill) #pour tuer : game.kill_player(game.enemies[0 ou 1 ou 2 ou 3])
	end

	def is_still_going? #permet de connaître les conditions de fin de partie
		if @human_player.life_points > 0 && @enemies.length != 0
			return true
		else 
			return false 
		end
	end

	def show_players # donne des infos à propos du héros et des bots (pv et armes)
		puts "il reste #{@enemies.length} ennemis et #{@human_player.name} a #{@human_player.life_points} points de vie."
	end

	def menu #donne différentes options d'action à l'utilisateur
		puts "\n\nQuelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"

		puts "Attaquer un joueur en vue :\n\n"
		i = 0
		@enemies.each do |enemy|
			puts "#{i} - #{enemy.name} a #{enemy.life_points} points de vie"
			i += 1
		end
		press_key = gets.chomp.to_s
		return menu_choice(press_key) #déclenche le menu_choice en lui donnant la touche appuyée (press_key) en entré
	end

	def menu_choice(a_string) #permet d'executer l'action choisie

		if a_string == "a"
			puts "\nTu cherches une arme"
			puts "=======================\n"
			@human_player.search_weapon
		elsif a_string == "s"
			puts "\nTu cherches un pack de vie"
			puts "=======================\n"
			@human_player.search_health_pack
		end

		@enemies.each_index do |index|
			index_string = index.to_s
			if a_string == index_string
				human_player.attacks(enemies[index])
				if enemies[index].life_points <= 0
					kill_player(enemies[index])
				end
			end
		end
	end

	def ennemies_attack # permet la riposte des bots 
		enemies.each do |attaque|
			attaque.attacks(@human_player)
		end
		@human_player.show_state
	end

	def end #ddéfinit deux outputs possible en cas de fin de partie, tu win ou tu loose

		if @human_player.life_points <= 0
			puts "T'es mauvais, t'as perdu, BOUHHHHHHH !"
		else 
			puts "Trop fort ma poule, t'as tout kill !!"
		end
	end


end