extends Node2D

onready var _game = get_node("/root/Store")

var atualValue = 0
var points = 0
var instances = []
var resolutionX = 278

var isDay = true
export var changeBGPoints = 10
var changeBGPointsProcess = changeBGPoints

func _ready():
	self.z_index = 20
	pass # Replace with function body.

func _process(_delta):
	if(changeBGPointsProcess == 0):
		changeBGPointsProcess = changeBGPoints
	pass

func makePoint():
	points += 1
	deleteNumber()
	makeNumber(points)

func makeNumber(number):
	var numbers = String(number)
	var res
	for i in numbers.length():
		_game.currentScoreNumber = numbers[i]
		res = load(str("res://src/models/ScoreNumber.tscn"))
		var s = res.instance()
		s.position = Vector2(((resolutionX + 25) / 2) - ((25 * numbers.length())/2) + (25 * i), 50)
		add_child(s)
		instances.append(s)

func deleteNumber():
	for i in range(instances.size()):
		instances[i].queue_free()
	instances = []
