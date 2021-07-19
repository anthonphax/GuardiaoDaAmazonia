extends Node2D

onready var fase_curupira = preload("res://scenes/fase_curupira.tscn")
onready var fase_arara = preload("res://scenes/raiz.tscn")

func _ready():	
	get_tree().change_scene_to(fase_arara)
	pass

func _process(delta):
	if 0 == 0:
		pass
