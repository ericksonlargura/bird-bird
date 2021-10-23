extends Node2D

onready var _game = get_node("/root/GameScript")
onready var _hudPoint = get_node("/root/HudPoints")
onready var _player = get_node("/root/PlayerNode")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.z_index = 5
	$TextureStart.visible = true
	$GameOverUI.visible = false
	$PlayAgain.visible = false
	get_tree().paused = true

func _process(_delta):
	if(_game.running):
		$TextureStart.visible = false
		$GameOverUI.visible = false
		$PlayAgain.visible = false
		get_tree().paused = false
	elif(_game.die):
		$GameOverUI.visible = true
		$PlayAgain.visible = true
		get_tree().paused = true
	
	$Cursor.position = get_global_mouse_position() - Vector2(-12, -10)


func resetGame():
	get_tree().paused = false
	_game.running = false
	_game.die = false
	_hudPoint.points = 0
	_ready()
	_player.resetPlayer()
	get_tree().paused = true
	pass


func _on_TextureButton_pressed():
	resetGame()
	pass # Replace with function body.
