extends Node


func _on_texture_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_texture_button_map_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/map.tscn")

func _on_texture_button_book_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/rules.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action("book"):
		get_tree().change_scene_to_file("res://Scenes/rules.tscn")
	elif event.is_action("map"):
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
	elif Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_texture_button_accept_pressed() -> void:
	pass

func _on_texture_button_deny_pressed() -> void:
	pass

	
