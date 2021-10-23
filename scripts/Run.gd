extends Node

var sprite = preload('res://resources/Pipes.tscn')

var pipes = []

var velocity = Vector2()

func _ready():
	pass

# func _process(_delta):

func _input(_event):
	if Input.is_action_pressed('right'):
		var s = sprite.instance()
		s.position = Vector2(100, 100)
		add_child(s)
		pipes.append(s)
