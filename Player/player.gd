extends CharacterBody2D

@onready var animation = $AnimationPlayer

func _ready():
	pass

func _input(event):
	#eu errei, um animated sprite serve para poucas animações,que não envolvem 
	#mais de uma direção
	if event.is_action_pressed("ui_accept") == false:
		#print("o código de Ui accept é só um teste, para ver se as animações funcionam")
		animation.play("Idle")
	else:
		animation.play("Jump")
