extends Control

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://Scenes/setting.tscn")
	elif Input.is_action_just_pressed("esc"):
		get_tree().quit()
