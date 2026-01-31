extends Node

const SAVE_PATH = "res://Assets/texto/names.txt"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var file_content = file.get_as_text()
	file.close()
	var json = JSON.new()
	var file_json = json.parse(file_content)
	
	
	
func _cargar_base_datos() -> Dictionary:
	# Si el archivo no existe, devolvemos una estructura vacía inicializada
	if not FileAccess.file_exists(SAVE_PATH):
		return { "registros": [] } # Equivalente a inicializar el struct base
	
	# Leemos el archivo
	var archivo = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var contenido_texto = archivo.get_as_text()
	archivo.close()
	
	# Parseamos JSON
	var json = JSON.new()
	var error = json.parse(contenido_texto)
	
	if error == OK:
		var datos = json.data
		# Validación defensiva: Asegurarnos de que tiene la key "registros"
		if not datos.has("registros"):
			datos["registros"] = []
		return datos
	else:
		push_error("JSON Corrupto. Reiniciando DB.")
		return { "registros": [] }



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
