extends CanvasLayer

func _ready():
	$Control/ConteinerCentro/VBoxContainer/Start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://MainGame/main_game.tscn")
	#res://MainGame/main_game.tscn;;; "res://Player/player.tscn"

func _on_quit_pressed():
	get_tree().quit()
