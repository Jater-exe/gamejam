extends Node

func _on_texture_button_return_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
