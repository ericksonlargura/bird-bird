extends ParallaxBackground

const SPEED = 100

onready var _score = get_node("/root/Score")

# Função para movimentação do background
# https://godotengine.org/qa/40998/how-to-make-an-infinite-scrolling-background
func _process(delta):
	scroll_offset.x -= delta * SPEED
	if(_score.points == _score.changeBGPointsProcess):
		_score.isDay = !_score.isDay
		_score.changeBGPointsProcess = _score.points + _score.changeBGPoints


func _on_Timer_timeout():
	if(_score.isDay and $ParallaxLayer/BackgroundDay.modulate.a8 <= 255):	
		$ParallaxLayer/BackgroundDay.modulate.a8 += 10
	if(!_score.isDay and $ParallaxLayer/BackgroundDay.modulate.a8 >= 0):
		$ParallaxLayer/BackgroundDay.modulate.a8 -= 10
	pass # Replace with function body.
