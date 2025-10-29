extends CharacterBody2D

class_name Player;	

var _cont: int = 0;
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var salto: AudioStreamPlayer2D = $Salto

# Constructor de la clase
func _init():
	_cont = 0;

# Métodos get y set de la clase
func _get_cont() -> int:
	return _cont;
	
func _set_cont(cont: int) -> void:
	_cont = cont;

# Función para morir
func _destroy() -> void:
	print("You died!");
	self.get_node("CollisionShape2D").queue_free();
	

func _physics_process(delta: float) -> void:
	# Añade la gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Monitora el salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

		
	var direction := Input.get_axis("move_left", "move_right")
	
	# Si la dirección es menor a 0, cambiamos el sprite al revés
	if(direction > 0):
		animated_sprite.flip_h = false;
	elif(direction < 0):
		animated_sprite.flip_h = true;
	
	# Si está en el suelo, ponemos la animación idle
	if(is_on_floor()):
		if(direction == 0):
			animated_sprite.play("idle");
		else:
			animated_sprite.play("move");
	else:
		animated_sprite.play("jump");
	
	# Para ejecutar una única vez el sonido de salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		salto.play();
	
	# Multiplicas la velocidad por la dirección para moverse en positivo o negativo
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
