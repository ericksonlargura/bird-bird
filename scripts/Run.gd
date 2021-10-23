extends Node

const PIPE_AFTER_SECONDS = 2
const RND_MIN_PIPE = 360.0
const RND_MAX_PIPE = 560.0
const RND_MIN_SPACE = 80.0
const RND_MAX_SPACE = 160.0
const PIPE_HEIGHT = 320
const VECTOR_X = 320
const SPEED = 100

var rng = RandomNumberGenerator.new()

var sprite = preload('res://resources/Pipes.tscn')
var point = preload('res://resources/Point.tscn')

var pipes = []
var seconds_passed = 0

func _ready():
	pass

func _process(delta):
	seconds_passed += delta
	
	if seconds_passed >= PIPE_AFTER_SECONDS:
		seconds_passed = 0

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

		var coin = point.instance()
		coin.position = Vector2(VECTOR_X, y - (PIPE_HEIGHT / 2.0) - (space / 2.0))
		add_child(coin)

		pipes.append({
			top = top_pipe,
			bottom = bottom_pipe,
			coin = coin
		})

	var should_remove = []
	for i in range(pipes.size()):
		if pipes[i].top.position.x < -80:
			pipes[i].top.queue_free()
			pipes[i].bottom.queue_free()
			pipes[i].coin.queue_free()
			should_remove.append(i)
		else:
			var velocity = Vector2(delta * SPEED, 0)
			pipes[i].top.position -= velocity
			pipes[i].bottom.position -= velocity
			pipes[i].coin.position -= velocity

	for i in should_remove:
		pipes.remove(i)
