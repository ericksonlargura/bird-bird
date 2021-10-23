extends Node2D

func _ready():
	# Inicia pausado
	get_tree().paused = true

func _input(_event):
	if Input.is_action_pressed('jump'):
		if get_tree().paused:
			get_tree().paused = false
