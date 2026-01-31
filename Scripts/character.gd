extends Node

@onready var _animated_sprite = $AnimatedSprite2D
@export var time: float = 0.0

func _ready() -> void:
	_animated_sprite.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time >= 0.25:
		_animated_sprite.scale.x += 0.1
		_animated_sprite.scale.y += 0.1
		time = delta
