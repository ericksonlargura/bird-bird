extends KinematicBody2D

const GRAVITY = 600.0
const JUMP_SPEED = 200
const ROTATION_DELTA = 0.05

var velocity = Vector2()
var defaultPosition = position
var defaultRotation = rotation

onready var _game = get_node("/root/GameScript")
onready var _animated_sprite = $AnimatedSprite

# Quando carregado, conecta o signal à determinada função
func _ready():
	_animated_sprite.connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")

# Sistema de gravidade
# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
func _physics_process(delta):
	if(Input.is_action_just_pressed("jump") and (!_game.running)):
		if(_game.die):
			_game.points = 0
		_game.running = true
	if(_game.running == false or _game.die == true):
		return
	velocity += Vector2(0, delta * GRAVITY)

	# Rotaciona o personagem de acordo com a direção
	if velocity.y > 0:
		if rotation < 1:
			rotation += ROTATION_DELTA
	else:
		if rotation > -1:
			rotation -= ROTATION_DELTA

	velocity = move_and_slide(velocity)

	# Identifica o objeto em contato
	# https://docs.godotengine.org/en/3.4/tutorials/physics/using_kinematic_body_2d.html#detecting-collisions
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision:
			# Chamar função para finalizar o jogo
				print('Em contato com ', collision.collider.name)
				_game.running = false
				_game.die = true

# Detecção de inputs
func _input(_event):
	if Input.is_action_pressed('jump'):
		if _animated_sprite.is_playing():
			_animated_sprite.stop()

		_animated_sprite.play('fly')
		velocity = Vector2(0, -JUMP_SPEED)

# Para o loop no último sprite da animação
func _on_AnimatedSprite_animation_finished():
	_animated_sprite.stop()

func resetBird():
	print('15')
	pass
