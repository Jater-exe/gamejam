extends VBoxContainer

func _on_texture_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/setting.tscn")


func _on_texture_button_exit_pressed() -> void:
	get_tree().quit()
