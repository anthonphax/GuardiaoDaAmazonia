extends Node2D


onready var interrogacao = $interrogacao2/sprite/info
onready var player = get_parent().get_node("player")

var info_visible = false

func _ready():
	interrogacao.text = "Caso você não saiba, a Amazonia representa 67% das florestas tropicais, abrigando um terço das árvores do mundo, e 20% das águas doces."
	interrogacao.visible = false
	$balao.visible = true
	$balao/label2.visible = false
	$balao/animation.play("fala_curupira")
func _process(delta):

	if info_visible:
		interrogacao.visible = true
func _on_Area2D_body_entered(body):
	if body == player:
		info_visible = true
