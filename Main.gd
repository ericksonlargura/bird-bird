extends Node2D

onready var _game = get_node("/root/Store")
onready var _player = get_node("/root/InitializePlayer")

func _ready():
	# Inicia pausado
	get_tree().paused = true

func _input(_event):
	if(Input.is_action_just_pressed("jump") and (!_game.running) and (!_game.hasMenuClick)):
		if(_game.die == true):
			return
		else:
			unPause()

func unPause():
	if get_tree().paused:
		get_tree().paused = false


func _on_StartMenu_shopMenu():
	_game.hasMenuClick = true
	_player.resetPlayer()
	$ChangeSkin.show()
	$ChangeSkin.z_index = 5
