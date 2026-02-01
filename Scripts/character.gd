extends Node

@onready var _animated_sprite = self
@export var time: float = 0.0
var scene_dni
var instance_dni
var person: Dictionary
var created_dni: bool = false

func _ready() -> void:
	if has_node("Mask"):
		return
	var scene = preload("res://Scenes/mask.tscn")
	var instance = scene.instantiate()
	instance.name = "Mask"
	add_child(instance)
	person["Mask"] = instance.get_mask()
	instance.position = Vector2(-200, -290)
	_animated_sprite.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:		
	if _animated_sprite.scale.x >= 1:
		_animated_sprite.stop()
		if not created_dni:
			scene_dni = preload("res://Scenes/dni.tscn")
			var instance_dni = scene_dni.instantiate()
			instance_dni.name = "dni"
			add_child(instance_dni)
			person["Birthplace"] = $dni/CanvasLayer/Id/Birth.text
			person["Number"] = $dni/CanvasLayer/Id/Number.text
			person["Age"] = $dni/CanvasLayer/Id/Age.text
			person["Name"] = $dni/CanvasLayer/Id/Name.text
			person["Surname"] = $dni/CanvasLayer/Id/Surname.text
			$dni/CanvasLayer/Id.position = Vector2(658 ,700)
			instance_dni.position = Vector2(0,0)
			created_dni = true

	if time >= 0.1 and _animated_sprite.scale.x < 1:
		_animated_sprite.scale.x += 0.05
		_animated_sprite.scale.y += 0.05
		_animated_sprite.position.y += 50
		time = delta
	elif _animated_sprite.scale.x < 1:
		time += delta
