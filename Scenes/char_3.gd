extends Node2D

func _ready() -> void:
	var scene2 = preload("res://Scenes/dni.tscn")
	var instance2 = scene2.instantiate()
	instance2.name = "dni"
	# Agregar a esta escena (Node2D raíz)
	add_child(instance2)

	# Posición después de agregarlo al árbol
	instance2.position = Vector2(1280,50)
