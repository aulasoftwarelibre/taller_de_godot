extends Button

func _ready():
	self.pressed.connect(Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	print("¡Botón presionado!")
