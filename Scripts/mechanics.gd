extends Node


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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	places_mask = load_json(PLACES_MASKS_PATH)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
