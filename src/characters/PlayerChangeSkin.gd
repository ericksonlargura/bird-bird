extends Node2D

onready var _game = get_node("/root/Store")

func _ready():
	var _player = load("res://src/characters/skins/" + _game.skinSelected + ".tscn")
	var instancePlayer = _player.instance()
	add_child(instancePlayer)

