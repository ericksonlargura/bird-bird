extends Node2D

const PIPE_AFTER_SECONDS = 2
const RND_MIN_PIPE = 360.0
const RND_MAX_PIPE = 560.0
const RND_MIN_SPACE = 100.0
const RND_MAX_SPACE = 160.0
const PIPE_HEIGHT = 320
const VECTOR_X = 320
const SPEED = 100

var rng = RandomNumberGenerator.new()

var sprite = preload('res://src/models/Pipes.tscn')
var point = preload('res://src/models/ScorePoint.tscn')
var coinModel = preload('res://src/models/Coin.tscn')

var pipes = []
var seconds_passed = 0
var should_create_coin = false

func _ready():
	pass

func _process(delta):
	seconds_passed += delta
	
	if seconds_passed >= PIPE_AFTER_SECONDS:
		seconds_passed = 0

		# Chance de gerar moeda
		rng.randomize()
		var random = rng.randf_range(0, 10)
		if random <= 2:
			should_create_coin = true

		rng.randomize()

		var space = rng.randf_range(RND_MIN_SPACE, RND_MAX_SPACE)
		var y = rng.randf_range(RND_MIN_PIPE, RND_MAX_PIPE)

		var bottom_pipe = sprite.instance()
		bottom_pipe.position = Vector2(VECTOR_X, y)
		add_child(bottom_pipe)

		var top_pipe = sprite.instance()
		top_pipe.position = Vector2(VECTOR_X, y - space - PIPE_HEIGHT)
		top_pipe.rotation = PI
		add_child(top_pipe)

		var collision = point.instance()
		collision.position = Vector2(VECTOR_X, y - (PIPE_HEIGHT / 2.0) - (space / 2.0))
		add_child(collision)

		var coin
		if should_create_coin:
			should_create_coin = false
			coin = coinModel.instance()
			coin.position = Vector2(VECTOR_X, y - (PIPE_HEIGHT / 2.0) - (space / 2.0))
			add_child(coin)

		pipes.append({
			top = top_pipe,
			bottom = bottom_pipe,
			collision = collision,
			coin = coin
		})

	var should_remove = []
	for i in range(self.pipes.size()):
		if self.pipes[i].top.position.x < -80:
			self.pipes[i].top.queue_free()
			self.pipes[i].bottom.queue_free()
			self.pipes[i].collision.queue_free()

			if self.pipes[i].coin:
				self.pipes[i].coin.queue_free()
			should_remove.append(i)
		else:
			var velocity = Vector2(delta * SPEED, 0)
			self.pipes[i].top.position -= velocity
			self.pipes[i].bottom.position -= velocity
			self.pipes[i].collision.position -= velocity

			if self.pipes[i].coin:
				self.pipes[i].coin.position -= velocity

	for i in should_remove:
		self.pipes.remove(i)


func deleteAllPipes():
	var should_remove = []
	for i in range(pipes.size()):
		self.pipes[i].top.queue_free()
		self.pipes[i].bottom.queue_free()
		self.pipes[i].collision.queue_free()

		if self.pipes[i].coin:
			self.pipes[i].coin.queue_free()
		should_remove.append(i)

	self.pipes = []
