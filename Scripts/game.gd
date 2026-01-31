extends Node

var times = 0
@onready var bell_sound = $Button_Bell/audiocampana

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
		bell_sound.play()
		state = 1
		$Button_Bell/AnimatedBell.play()
		await get_tree().create_timer(1).timeout
		bell_sound.stop()
		$Button_Bell/AnimatedBell.stop()
		$AnimatedDoor.play()
		$AnimatedDoor.visible = true;


func _on_animated_door_animation_looped() -> void:
	$AnimatedDoor.stop()
	$AnimatedDoor.visible = false;
