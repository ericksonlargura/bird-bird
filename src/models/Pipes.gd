extends Node2D

onready var _score = get_node("/root/Score")

func _ready():
	pass 

func _on_Timer_timeout():
	if(_score.isDay and $StaticBody2D/Sprite.modulate.a8 <= 255):
		$StaticBody2D/Sprite.modulate.a8 += 10
	if(!_score.isDay and $StaticBody2D/Sprite.modulate.a8 >= 0):
		$StaticBody2D/Sprite.modulate.a8 -= 10
	pass # Replace with function body.
