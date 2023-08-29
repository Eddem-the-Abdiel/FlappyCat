extends Area2D

var pilarSpeed = -105
func _physics_process(delta):
	#O position tem o x negativo, porque ele anda na direção da esquerda, em direção ao jogador
	#sendo assim, o player não se mexe, somente os pilares
	position += Vector2(pilarSpeed * delta, 0)
