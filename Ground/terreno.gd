extends Node2D

class_name terreno

@export var speed = -150

@onready var sprite1 = $"Terreno 1/Sprite2D"
@onready var sprite2 = $"Terreno 2/Sprite2D"


func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func _physics_process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	#Quando o sprite1 sair completamente da tela mova para a direita do sprite2
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
	
	#Quando o sprite2 sair completamente da tela mova para a direita do sprite1
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite2.texture.get_width()
