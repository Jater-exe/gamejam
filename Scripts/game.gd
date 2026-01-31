extends Node



func _on_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_button_map_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/map.tscn")


func _on_button_book_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/rules.tscn")
