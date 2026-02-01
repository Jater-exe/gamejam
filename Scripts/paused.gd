extends Node


func _on_texture_button_continue_pressed() -> void:
	get_tree().paused = false
	queue_free()


func _on_texture_button_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
