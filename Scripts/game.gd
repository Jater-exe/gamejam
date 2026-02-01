extends Node

var times = 0
@onready var bell_sound = $CanvasLayer/Button_Bell/audiocampana
var state:int = 0

var scene = preload("res://Scenes/map.tscn")
var scene2
var instancemap
var instance
func _on_texture_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_texture_button_map_pressed() -> void:
	if has_node("mapita") :
		instancemap.queue_free()
		return
	instancemap = scene.instantiate()
	instancemap.name = "mapita"
	add_child(instancemap)
	

func _on_texture_button_book_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/rules.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("book"):
		get_tree().change_scene_to_file("res://Scenes/rules.tscn")
	elif event.is_action("map"):
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
	elif Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_texture_button_accept_pressed() -> void:
	if state == 2:
		instance.queue_free()
		state = 0

func _on_texture_button_deny_pressed() -> void:
	if state == 2:
		instance.queue_free()
		state = 0

func person_arrive():
	scene2 = preload("res://Scenes/char2.tscn")
	instance = scene2.instantiate()
	instance.name = "person"
	add_child(instance)
	instance.position = Vector2(950, 300)
	state = 2

func _on_texture_button_bell_pressed() -> void:
	if times == 0 and state == 0:
		bell_sound.play()
		state = 1
		$CanvasLayer/Button_Bell/AnimatedBell.play()
		await get_tree().create_timer(1).timeout
		bell_sound.stop()
		$CanvasLayer/Button_Bell/AnimatedBell.stop()
		$AnimatedDoor.play()
		$AnimatedDoor.visible = true;

func _on_animated_door_animation_finished() -> void:
	$AnimatedDoor.visible = false;
	$AnimatedDoor.stop()
	person_arrive()

func _on_animated_door_ready() -> void:
	$AnimatedDoor.visible = false
