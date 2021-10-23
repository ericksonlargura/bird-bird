extends Area2D

onready var _hudPoint = get_node("/root/HudPoints")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	pass




func _on_point_player_entered(body):
	_hudPoint.makePoint()
	pass # Replace with function body.
