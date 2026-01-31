extends Node

const MASKS_JSON = "res://Assets/Text/masks.json"


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


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var data = load_json(MASKS_JSON)
	if data is Array and data.size() > 0:
		var random_element = data.pick_random()
		var LOAD_PATH = "res://Assets/Textures/mask_oficial/"
		LOAD_PATH += random_element
		self.texture = load(LOAD_PATH)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
