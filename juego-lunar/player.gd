extends CharacterBody2D

# --- Variables ---
@export var speed = 200.0
@export var health = 100 # Vida del jugador


# --- Bucle de Físicas ---
# Se ejecuta en cada fotograma para gestionar el movimiento
func _physics_process(delta):
	# Creamos un vector de dirección vacío
	var direction = Vector2.ZERO

	# Revisamos cada acción del Input Map una por una
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalizamos el vector para que el movimiento diagonal no sea más rápido
	direction = direction.normalized()

	# Calculamos la velocidad y movemos el personaje
	velocity = direction * speed
	move_and_slide()


# --- Función de Combate ---
# Se llama cuando una bala u otro objeto daña al jugador
func recibir_dano(cantidad):
	health -= cantidad
	print("¡Auch! Vida restante del jugador: ", health)
	if health <= 0:
		print("¡Has sido derrotado!")
		queue_free() # El jugador desaparece al morir
