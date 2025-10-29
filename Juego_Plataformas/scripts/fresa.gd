extends Area2D

@onready var etiqueta_frutas: Label = $"../../CanvasLayer/Frutas"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	
	# Obtiene las frutas del jugador
	var new_cont = body._get_cont();
	new_cont = new_cont + 1;
	
	# Suma una y las actualiza, luego actualiza la etiqueta de frutas
	body._set_cont(new_cont);
	etiqueta_frutas.text = "Frutas: " + str(body._get_cont());
	
	# Ejecuta la animación de pickup para ejecutar el sonido y borrar la fruta
	animation_player.play("pickup");
