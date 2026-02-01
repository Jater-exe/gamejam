extends Node

var times = 0
@onready var bell_sound = $CanvasLayer/Button_Bell/audiocampana
var state:int = 0
var old_state:int = 0

var scene = preload("res://Scenes/map.tscn")
var scene2
var scene3
var scene4
var instancemap
var instance
var instancebook
var instancepaused
func _on_texture_button_menu_pressed() -> void:
	scene4 = preload("res://Scenes/paused.tscn")
	if has_node("paused") :
		return
	instancepaused = scene4.instantiate()
	instancepaused.name = "paused"
	add_child(instancepaused)
	get_tree().paused = true

@onready var places_mask

const PLACES_MASKS_PATH = "res://Assets/Text/places_masks.json"


func load_json(path: String) -> Variant:
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open JSON file")
		return null

	var json_text = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(json_text)

	if error != OK:
		push_error("JSON parse error")
		return null

	return json.data

func is_bad(person: Dictionary) -> bool:
	if person["Mask"] not in places_mask[person["Birthplace"]]:
		return false
	else:
		return true

func _on_texture_button_map_pressed() -> void:
	if state == 2 or state == 0:
		if has_node("big_map") :
			return
		instancemap = scene.instantiate()
		instancemap.name = "big_map"
		add_child(instancemap)
		old_state = state
		state = 3
	

func _on_texture_button_book_pressed() -> void:
	if state == 2 or state == 0:
		scene3 = preload("res://Scenes/rules.tscn")
		if has_node("book") :
			return
		instancebook = scene3.instantiate()
		instancebook.name = "book"
		add_child(instancebook)
		old_state = state
		state = 3


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


func _on_child_exiting_tree(node: Node) -> void:
	if node.name == "big_map" or node.name == "book":
		state = old_state
