extends Area2D

onready var _game = get_node("/root/Store")

onready var _sprite = $Sprite

var computed = false

func _ready():
	pass

func _process(_delta):
	pass

func _on_Area2D_body_entered(_body):
	if not computed:
		_sprite.visible = false
		_game.coins += 1
		computed = true
