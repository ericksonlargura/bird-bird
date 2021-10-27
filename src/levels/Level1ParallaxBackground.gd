extends ParallaxBackground

const SPEED = 100
var isDay = true
export var changeBGPoints = 1
var changeBGPointsProcess = changeBGPoints

onready var _score = get_node("/root/Score")

# Função para movimentação do background
# https://godotengine.org/qa/40998/how-to-make-an-infinite-scrolling-background
func _process(delta):
	scroll_offset.x -= delta * SPEED
	if(_score.points == changeBGPointsProcess):
		isDay = !isDay
		changeBGPointsProcess = _score.points + changeBGPoints


func _on_Timer_timeout():
	if(isDay and $ParallaxLayer/BackgroundDay.modulate.a8 <= 255):	
		$ParallaxLayer/BackgroundDay.modulate.a8 += 10
	if(!isDay and $ParallaxLayer/BackgroundDay.modulate.a8 >= 0):
		$ParallaxLayer/BackgroundDay.modulate.a8 -= 10
	pass # Replace with function body.
