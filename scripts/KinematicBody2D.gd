extends KinematicBody2D

var velocity = Vector2()

const GRAVITY = 600.0
const JUMP_SPEED = 200
const ROTATION_DELTA = 0.05

onready var _animated_sprite = $AnimatedSprite

# Quando carregado, conecta o signal à determinada função
func _ready():
	_animated_sprite.connect('animation_finished', self, '_on_animated_sprite_animation_finished')

# Sistema de gravidade
# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
func _physics_process(delta):
	velocity += Vector2(0, delta * GRAVITY)

	# Rotaciona o personagem de acordo com a direção
	if velocity.y > 0:
		if rotation < 1:
			rotation += ROTATION_DELTA
	else:
		if rotation > -1:
			rotation -= ROTATION_DELTA
	print(rotation)

	move_and_slide(velocity)

# Detecção de inputs
func _input(_event):
	if Input.is_action_pressed('jump'):
		if _animated_sprite.is_playing():
			_animated_sprite.stop()

		_animated_sprite.play('fly')
		velocity = Vector2(0, -JUMP_SPEED)

# Para o loop no último sprite da animação
func _on_animated_sprite_animation_finished():
	_animated_sprite.stop()
