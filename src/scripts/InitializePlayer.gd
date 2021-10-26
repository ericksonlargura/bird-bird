extends Node2D

onready var _randomPipes = get_node("/root/RunPipes")

var _player = preload('res://src/characters/Player.tscn')
var instances = []

func _ready():
	self.insertPlayer()

# Resetando pinto
func resetPlayer():
	_randomPipes.deleteAllPipes()
	for i in range(self.instances.size()):
		self.instances[i].queue_free()
	instances = []
	self.insertPlayer()

# Inserindo pinto via instance
func insertPlayer():
	if(instances.size() <= 0):
		var instancePlayer = _player.instance()
		instancePlayer.position = Vector2(142, 334)
		add_child(instancePlayer)
		instances.append(instancePlayer)
