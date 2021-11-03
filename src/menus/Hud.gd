extends Node2D

onready var _label = $Label

onready var _game = get_node("/root/Store")
onready var _save = get_node("/root/SaveGame")

func _ready():
	_save.load_game()

func _process(_delta):
	_label.text = String(_game.coins) + " coins"
