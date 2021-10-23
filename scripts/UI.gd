extends Node2D

onready var _game = get_node("/root/GameScript")

func _ready():
	self.z_index = 5
	$TextureStart.visible = true
	$GameOverUI.visible = false
	get_tree().paused = true


func _process(delta):
	if(_game.running):
		$TextureStart.visible = false
		$GameOverUI.visible = false	
		get_tree().paused = false
	elif(_game.die):
		$GameOverUI.visible = true
		get_tree().paused = true
