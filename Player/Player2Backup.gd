extends  CharacterBody2D

class_name player

@export var gravity = 900.0
@export var jump_force = -270
@export var rotation_speed = 2
@onready var animation_player = $AnimationPlayer
@onready var gamePoints = get_node("/root/Controle")

var max_speed = 400
var is_started = false
var should_process_input = true

func ready():
	velocity = Vector2(0,0)
	if should_process_input == true:
		print("pode input")
	
func _physics_process(delta):
	"""if Input.is_action_just_pressed("jump") && should_process_input:
		if !is_started:
			is_started = true
			jump()
	
"""
	if !is_started:
		is_started = true
	velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, max_speed)
	
	move_and_slide()
	
	"rotate_cat()"
	
"""func jump():
	velocity.y = jump_force
	#rotation = deg_to_rad(-30)
	animation_player.play("Jump")"""

"""func rotate_cat():
	#Rodar para baixo ao cair
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	#Rode para cima ao cair
	elif velocity.y < 0 && rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1) """
	
func _input(event):
	if should_process_input == true:
		print("disk tá recebendo input ")
		#eu errei, um animated sprite serve para poucas animações,que não envolvem 
		#mais de uma direção
		if event.is_action_pressed("ui_accept") or event.is_action_pressed("jumpPress") == false:
			#print("o código de Ui accept é só um teste, para ver se as animações funcionam")
			animation_player.play("Idle")
			print("não apertou para pular")
		else:
			animation_player.play("Jump")
			print("apertou para pular")
			jump()
			
	else:
		pass

func jump():
	velocity.y = jump_force

func catLoses():
	animation_player.stop()
	gravity = gravity * 1.5
	should_process_input = false
	$Timer.start()



func _on_area_2d_body_entered(body):
	if body.name == "Pillars":
		catLoses()
		
func _on_area_2d_area_entered(area):
	#Aumenta score
	if area.name == "PointArea":
		gamePoints.score += 1
		
	if area.name == "Tereno1" or "Tereno2":
		print("me diga então")
		catLoses()
	

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://User Interface  (UI)/mainMenu.tscn")