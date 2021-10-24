extends Node2D

var atualValue = 0
var points = 0
var instances = []
var resolutionX = 278

func _ready():
	self.z_index = 20
	pass # Replace with function body.

func _process(_delta):
	pass

func makePoint():
	points += 1
	deleteNumber()
	makeNumber(points)

func makeNumber(number):
	var numbers = String(number)
	var res
	for i in numbers.length():
		match String(numbers[i]):
			'0':
				res = preload("res://resources/UI/numbers/Number0.tscn")
			'1':
				res = preload("res://resources/UI/numbers/Number1.tscn")
			'2':
				res = preload("res://resources/UI/numbers/Number2.tscn")
			'3':
				res = preload("res://resources/UI/numbers/Number3.tscn")
			'4':
				res = preload("res://resources/UI/numbers/Number4.tscn")
			'5':
				res = preload("res://resources/UI/numbers/Number5.tscn")
			'6':
				res = preload("res://resources/UI/numbers/Number6.tscn")
			'7':
				res = preload("res://resources/UI/numbers/Number7.tscn")
			'8':
				res = preload("res://resources/UI/numbers/Number8.tscn")
			'9':
				res = preload("res://resources/UI/numbers/Number9.tscn")

		var s = res.instance()
		s.position = Vector2(((resolutionX + 25) / 2) - ((25 * numbers.length())/2) + (25 * i), 50)
		add_child(s)
		instances.append(s)

func deleteNumber():
	for i in range(instances.size()):
		instances[i].queue_free()
	instances = []
