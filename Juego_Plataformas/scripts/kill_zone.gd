extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Destruye al jugador y recarga la escena
	body._destroy();
	get_tree().change_scene_to_file("res://scenes/you_lose.tscn");
