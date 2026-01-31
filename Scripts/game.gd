extends Node

var times = 0

var state:int = 0

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
	if state == 2:
		state = 0

func _on_texture_button_deny_pressed() -> void:
	if state == 2:
		state = 0


func _on_texture_button_bell_pressed() -> void:
	if times == 0 and state == 0:
		state = 1
		$Button_Bell/AnimatedSprite2D.play()
		
		await get_tree().create_timer(1).timeout
		
		$Button_Bell/AnimatedSprite2D.stop()
		get_tree().change_scene_to_file("res://Scenes/mouporta.tscn")
