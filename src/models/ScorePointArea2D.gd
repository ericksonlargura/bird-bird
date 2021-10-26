extends Area2D

onready var _hudPoint = get_node("/root/Score")

var pointContabilizado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	pass

func _on_Area2D_body_entered(_body):
	if(!pointContabilizado):
		_hudPoint.makePoint()
		pointContabilizado = true
