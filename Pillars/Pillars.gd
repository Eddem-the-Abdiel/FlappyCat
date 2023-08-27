extends StaticBody2D

func _physics_process(_delta):
	#O position tem o x negativo, porque ele anda na direção da esquerda, em direção ao jogador
	#sendo assim, o player não se mexe, somente os pilares
	position += Vector2(-2, 0)
