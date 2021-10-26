extends Node2D

onready var _game = get_node("/root/Store")

func _ready():
	# Inicia pausado
	get_tree().paused = true

func _input(_event):
	if(Input.is_action_just_pressed("jump") and (!_game.running)):
		if(_game.die == true):
			return
		else:
			unPause()

func unPause():
	if get_tree().paused:
		get_tree().paused = false
