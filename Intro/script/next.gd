extends Area2D

onready var player = get_node("../../player")
export var pos = Vector2(500, 200)

func _ready():
#	player.position = pos
	pass

func _process(delta):
	pass
		


func _on_Area2D_area_entered(area):
	print(area.position)
