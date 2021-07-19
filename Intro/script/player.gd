extends KinematicBody2D

var timer = false
var timer_time = 0
var count = 0
var label_count = 0
var velocity = 100
var velocity_player = 2.5
var perto_arara = false
var perto_curupira = false
var balao_text = [
	"ME AJUDE POR FAVOR!",
	"A FLORESTA ESTÁ PEGANDO FOGO!",
	"SIGA O CAMINHO \n SALVE OS ANIMAIS!"
	]
var info = false
onready var balao = get_parent().get_node("balao")
onready var arara = get_parent().get_node("arara")
onready var curupira = get_parent().get_node("curupira")
onready var curupira_animation = get_parent().get_node("curupira/a_sprite")
onready var fala = get_parent().get_node("balao/fala1")
onready var seta = get_parent().get_node("seta")
onready var interrogacao = get_parent().get_node("interrogacao")
onready var interrogacao_sprite = get_parent().get_node("interrogacao/sprite")


func _ready():
	if interrogacao_sprite == null:
		interrogacao_sprite = get_parent().get_node("interrogacao2/sprite")
		interrogacao = get_parent().get_node("interrogacao2")

	seta.visible = false
	balao.visible = false
	
func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("right"):
		$a_sprite.animation = "run"
		direction.x = velocity_player
		$a_sprite.play("true")
	if Input.is_action_just_pressed("right"):
		$a_sprite.scale.x = abs($a_sprite.scale.x)
	if Input.is_action_pressed("left"):
		$a_sprite.animation = "run"
		$a_sprite.play("true")
		direction.x = velocity_player * -1
	if Input.is_action_just_pressed("left"):
		if $a_sprite.scale.x > 0:
			$a_sprite.scale.x *= -1
	if Input.is_action_pressed("up"):
		$a_sprite.animation = "run"
		$a_sprite.play("true")
		direction.y = velocity_player * -1
	if Input.is_action_pressed("down"):
		$a_sprite.animation = "run"
		$a_sprite.play("true")
		direction.y = velocity_player
	if Input.is_action_just_released("left") || Input.is_action_just_released("right") || Input.is_action_just_released("up") || Input.is_action_just_released("down"):
		$a_sprite.animation = "idle"
	move_and_slide(direction * velocity)
	
	if timer == true:
		if timer_time >= 100:
			seta.visible = true
		else:
			timer_time += 1
	
	if info:
		interrogacao_sprite.visible = true
	else:
		interrogacao_sprite.visible = false
	print(position.x)
func _input(event):
	if Input.is_action_pressed("ui_accept") and perto_arara:
		balao.visible = true
		fala.text = balao_text[count]
		fala.visible = true
		count += 1
	if count > balao_text.size() - 1:
		timer = true
		count = 0
	if Input.is_action_pressed("ui_accept") and perto_curupira:
		if Input.is_action_just_pressed("ui_accept") and label_count == 0:
			label_count+=1
			curupira_animation.frame+=1
			get_parent().get_node("balao/animation").stop()
			get_parent().get_node("balao/label").percent_visible = 1
		elif Input.is_action_just_pressed("ui_accept") and label_count == 1:
			label_count+=1
			get_parent().get_node("balao/label2").visible = true
			get_parent().get_node("balao/label").visible = false
			get_parent().get_node("balao/animation2").play("fala_curupira2")
		elif Input.is_action_just_pressed("ui_accept") and label_count == 2:
			label_count+=1
			curupira_animation.frame+=1
			get_parent().get_node("balao/animation2").stop()
			get_parent().get_node("balao/label2").percent_visible = 1
		elif Input.is_action_just_pressed("ui_accept") and label_count == 3:
			label_count+=1
			get_parent().get_node("balao/label3").visible = true
			get_parent().get_node("balao/label2").visible = false
			get_parent().get_node("balao/animation3").play("fala_curupira3")
		elif Input.is_action_just_pressed("ui_accept") and label_count == 4:
			label_count+=1
			curupira_animation.frame+=1
			get_parent().get_node("balao/animation3").stop()
			get_parent().get_node("balao/label3").percent_visible = 1
		elif Input.is_action_just_pressed("ui_accept") and label_count == 5:
			label_count+=1
			get_parent().get_node("balao/label4").visible = true
			get_parent().get_node("balao/label3").visible = false
			get_parent().get_node("balao/animation4").play("fala_curupira4")

func _on_Area2D_body_entered(body):
	if body == curupira:
		perto_curupira = true
	if body == arara:
		perto_arara = true
	if body == interrogacao:
		info = true

func _on_Area2D_body_exited(body):
	if body == curupira:
		perto_curupira = false
	if body == arara:
		perto_arara = false
	if body == interrogacao:
		info = false
