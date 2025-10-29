extends Area2D

@onready var fresas: Node = $"../Fresas";
@onready var min_frutas: Label = $"../MinFrutas"
var num_fresas: int

func _ready() -> void:
	# Obtiene el número de fresas cuando estén los objetos cargados
	num_fresas = fresas.get_child_count();

func _on_body_entered(body: Node2D) -> void:
	
	if(body._get_cont() == (num_fresas)):
		get_tree().change_scene_to_file("res://scenes/you_win.tscn");
	else:
		min_frutas.text = "Necesitas " + str(fresas.get_child_count()) + " fresas";
