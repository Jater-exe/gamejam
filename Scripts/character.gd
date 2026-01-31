extends Node

@onready var _animated_sprite = self
@export var time: float = 0.0

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
	if time >= 0.25 and _animated_sprite.scale.x < 1:
		_animated_sprite.scale.x += 0.1
		_animated_sprite.scale.y += 0.1
		_animated_sprite.position.y += 100
		time = delta
	elif _animated_sprite.scale.x < 1:
		time += delta
