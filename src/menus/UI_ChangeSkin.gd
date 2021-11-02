extends Node2D

var skinSelectedId = 0
var skins_options = ["BlueBird", "YellowBird", "RedBird"]
var instances = []

signal ShopMenuOpen

func _ready():
	hide()
	changeSkin()
	
func nextSkin():
	if((skinSelectedId + 1) < skins_options.size()):
		skinSelectedId += 1 
		skins_options[skinSelectedId]
	
	changeSkin()

func backSkin():
	if(skinSelectedId > 0):
		skinSelectedId -= 1 
		skins_options[skinSelectedId]
		
	changeSkin()

func changeSkin():
	self.removeSkinsInstance()
	var _player = load("res://src/characters/skins/" + skins_options[skinSelectedId] + ".tscn")
	var instancePlayer = _player.instance()
	instancePlayer.position = Vector2(145, 185)
#	instancePlayer.scale = 0.813
	instances.append(instancePlayer)
	add_child(instancePlayer)

func removeSkinsInstance():
	for i in range(self.instances.size()):
		self.instances[i].queue_free()
	instances = []

func _on_BtnLeft_pressed():
	backSkin()

func _on_BtnRight_pressed():
	nextSkin()
