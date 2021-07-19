extends CollisionShape2D

onready var player = get_node("../../player")

func _ready():
	print (player.name)
	
	pass

