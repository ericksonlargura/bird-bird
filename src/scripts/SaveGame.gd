extends Node

onready var _game = get_node("/root/Store")

func _ready():
	pass

# Função para salvar o game
# https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
func save_game():
	var save_dict = {
		"points" : _game.points,
		"time" : OS.get_datetime()
	}

	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	var node_data = parse_json(save_game.get_line())

	save_game.close()
