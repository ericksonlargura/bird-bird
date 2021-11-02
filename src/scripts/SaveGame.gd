extends Node

onready var _game = get_node("/root/Store")

func _ready():
	pass

# Função para salvar o game
# https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
func save_game():
	var date = OS.get_datetime()

	var data = {
		"points" : _game.points,
		"time" : date
	}

	var directory = Directory.new()

	if not directory.dir_exists('user://saves'):
		directory.make_dir('user://saves')

	var formatted_date = ("%s-%s-%s_%s.%s.%s" % [date['year'], date['month'], date['day'], date['hour'], date['minute'], date['second']])

	var save_game = File.new()
	save_game.open("user://saves/" + formatted_date + ".save", File.WRITE)
	save_game.store_line(to_json(data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	var _node_data = parse_json(save_game.get_line())

	save_game.close()
