extends  CharacterBody2D

class_name player

@export var gravity = 900.0
@export var jump_force = -270
@onready var animation_player = $AnimationPlayer
@onready var gamePoints = get_node("/root/Controle")

var max_speed = 400
var is_started = true
var should_process_input = true
var pillar = preload("res://Pillars/pillars.tscn")

func ready():
	velocity = Vector2(0,0)
	
func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, max_speed)
	
	move_and_collide(velocity * delta)
	
	
func _input(event):
	if should_process_input == true:
		print("input ")
		#eu errei, um animated sprite serve para poucas animações,que não envolvem 
		#mais de uma direção
		if event.is_action_pressed("ui_accept") or event.is_action_pressed("jumpPress") == true:
			animation_player.play("Jump")
			print("apertou para pular")
			jump()
			
		elif event.is_action_pressed("ui_accept") or event.is_action_pressed("jumpPress") == false:
			#print("o código de Ui accept é só um teste, para ver se as animações funcionam")
			animation_player.play("Idle")
			print("não apertou para pular")
			
		else:
			print("algo deu errado")
	else:
		print("não tá recebendo")

func jump():
	velocity.y = jump_force 

func catLoses():
	print("gato perdeu")
	animation_player.stop()
	gravity = gravity * 1.5
	should_process_input = false
	$Timer.start()
	print("timer iniciou")
	
func pillarReset():
	var pillarInstance = pillar.instantiate()
	pillarInstance.position = Vector2(500, randf_range(60,120))
	get_parent().call_deferred("add_child", pillarInstance)





func _on_area_2d_body_entered(body):
	print("body entered")
	if body.name == "Pillars":
		catLoses()

func _on_area_2d_area_entered(area):
	print("area entered")
	#Aumenta score
	if area.name == "PointArea":
		gamePoints.score += 1
		print(gamePoints.score)
		
	elif area.name == "Tereno1" or "Tereno2":
		print("me diga então")
		catLoses()
		
	print(area.name)

func _on_timer_timeout():
	print("acabou-se")
	get_tree().change_scene_to_file("res://User Interface  (UI)/mainMenu.tscn")


func _on_resetter_body_entered(body):
	if body.name == "Pillars":
		print("é uma pilar")
		body.queue_free()
		pillarReset()
