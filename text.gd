extends RichTextLabel

@onready var label = $RichTextLabel
@onready var typing_sound = $AudioStreamPlayer

var full_text := ""
var char_index := 0
var typing_speed := 0.05

func _ready():
	load_text_file("res://textoinicio.txt")
	label.text = full_text
	label.visible_characters = 0
	type_text()

func load_text_file(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		full_text = file.get_as_text()

func type_text():
	while char_index < full_text.length():
		char_index += 1
		label.visible_characters = char_index
		
		if typing_sound and full_text[char_index - 1] != " ":
			typing_sound.play()
		
		await get_tree().create_timer(typing_speed).timeout
