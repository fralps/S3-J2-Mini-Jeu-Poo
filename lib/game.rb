require 'pry'

class Game
	attr_accessor :human_player, :enemies

	def initialize(name)
		@human_player = HumanPlayer.new(name)
		@enemies = [Player.new("zoe"), Player.new("tortue"), Player.new("gros connard"), Player.new("trouduc")]
	end

	def kill_player(player_to_kill)
		# @enemies.each do |player|
		# 	if (player.life_points < 0)
		# 		@enemies.delete(player)
		# 		puts "#{player.name} est mort"
		# 	end
		# end
		@enemies.delete(player_to_kill) #pour tuer : game.kill_player(game.enemies[0 ou 1 ou 2 ou 3])
	end

	def is_still_going?
		if @human_player.life_points > 0 && @enemies.length != 0
			return true
		else 
			return false
		end
	end

	def show_players
		puts "il reste #{@enemies.length} ennemis et notre héros a #{@human_player.life_points} points de vie."
	end

	def menu
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
		return menu_choice(press_key)
	end

	def menu_choice(a_string)

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
				#puts "#{n} - tu attaques #{enemy.name}"
			#end
				if enemies[index].life_points <= 0
					kill_player(enemies[index])
					#kill_player

				end
			end
		end
	end
end