extends Button

func _on_pressed() -> void:
	# Cambia a la escena principal
	get_tree().change_scene_to_file("res://scenes/juego.tscn");
