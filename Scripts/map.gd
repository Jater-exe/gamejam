extends Node
var tocat : bool=false
func _on_texture_button_return_pressed() -> void:
	queue_free()
	
func _input(event: InputEvent) -> void:
	tocat=true
	if Input.is_action_just_pressed("esc"):
		queue_free()
