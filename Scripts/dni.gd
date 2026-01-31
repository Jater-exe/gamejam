extends Node

const NAMES_JSON = "res://Assets/Text/names.json"
const SURENAME_JSON = "res://Assets/Text/surename.json"
const AGE_JSON = "res://Assets/Text/age.json"
const BIRTH_JSON = "res://Assets/Text/birth.json"


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
	var data = load_json(NAMES_JSON)
	if data is Array and data.size() > 0:
		var random_element = data.pick_random()
		$Name.text = random_element
		
	data = load_json(SURENAME_JSON)
	if data is Array and data.size() > 0:
		var random_element = data.pick_random()
		$Surename.text = random_element
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func generar_codigo() -> String:
	randomize()

	# Número random de 8 dígitos
	var numero = randi_range(10000000, 99999999)

	# Letra random (A-Z)
	var letra = char(randi_range(65, 90))

	return str(numero) + letra
