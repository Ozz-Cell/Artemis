extends Area2D

var speed = 300.0
var direction = Vector2.ZERO

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.recibir_dano(10)
	
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
