extends CanvasLayer

func _on_start_pressed():
	print("botão pressionado")
	get_tree().change_scene_to_file("res://Player/player.tscn")