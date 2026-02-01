extends Node

@onready var _animated_sprite = self
@export var time: float = 0.0
var scene_dni
var instance_dni

func _ready() -> void:
	if has_node("Mask"):
		return
	var scene = preload("res://Scenes/mask.tscn")
	var instance = scene.instantiate()
	instance.name = "Mask"
	add_child(instance)
	instance.position = Vector2(-200, -290)
	_animated_sprite.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:		
	if _animated_sprite.scale.x >= 1:
		_animated_sprite.stop()
		scene_dni = preload("res://Scenes/dni.tscn")
		var instance_dni = scene_dni.instantiate()
		instance_dni.name = "dni"
		add_child(instance_dni)
		instance_dni.position = Vector2(180,50)
	if time >= 0.25 and _animated_sprite.scale.x < 1:
		_animated_sprite.scale.x += 0.1
		_animated_sprite.scale.y += 0.1
		_animated_sprite.position.y += 100
		time = delta
	elif _animated_sprite.scale.x < 1:
		time += delta
