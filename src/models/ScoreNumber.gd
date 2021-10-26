extends Node2D

onready var _game = get_node("/root/Store")

func _ready():
	$Number.texture = load("res://assets/sprites/" + _game.currentScoreNumber + ".png")
