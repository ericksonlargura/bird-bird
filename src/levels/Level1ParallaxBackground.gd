extends ParallaxBackground

const SPEED = 100

# Função para movimentação do background
# https://godotengine.org/qa/40998/how-to-make-an-infinite-scrolling-background
func _process(delta):
	scroll_offset.x -= delta * SPEED
