extends Node2D

onready var _game = get_node("/root/Store")
onready var _hudPoint = get_node("/root/Score")
onready var _player = get_node("/root/InitializePlayer")

func _ready():
	_hudPoint.points = 0
	_hudPoint.deleteNumber()
	_hudPoint.makeNumber(0)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.z_index = 5
	$TextureStart.visible = true
	$GameOverUI.visible = false
	$Play.visible = false
	$Shop.visible = false
	get_tree().paused = true

func _process(_delta):
	if(_game.running):
		$TextureStart.visible = false
		$GameOverUI.visible = false
		$Play.visible = false
		get_tree().paused = false
	elif(_game.die):
		$GameOverUI.visible = true
		
		$Play.visible = true
		$Shop.visible = true
		#animateButton($Shop, 1.2)
		get_tree().paused = true
	
	$Cursor.position = get_global_mouse_position() - Vector2(-12, -10)


func resetGame():
	get_tree().paused = false
	_game.running = false
	_game.die = false
	_hudPoint.points = 0
	_player.resetPlayer()
	self._ready()
	get_tree().paused = true
	pass

func _on_PlayAgain_pressed():
	self.resetGame()
