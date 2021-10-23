extends Node2D

onready var _game = get_node("/root/GameScript")

func _ready():
<<<<<<< Updated upstream
=======
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.z_index = 5
>>>>>>> Stashed changes
	$TextureStart.visible = true
	$GameOverUI.visible = false
	$ButtonPlay.visible = false
	get_tree().paused = true
	z_index = 5

func _process(delta):
	if(_game.running):
		$TextureStart.visible = false
		$GameOverUI.visible = false
		$ButtonPlay.visible = false
		get_tree().paused = false
	elif(_game.die):
		$GameOverUI.visible = true
		$ButtonPlay.visible = true
		get_tree().paused = true
	
	print(get_global_mouse_position())
	$Cursor.position = get_global_mouse_position() - Vector2(-12, -10)
