extends Node2D

@onready var scoreLabel = get_node("//root/Controle")

func _ready():
	scoreLabelReset()
	
func scoreLabelReset():
	scoreLabel.score = 0
