extends Control

@onready var text_label = $RichTextLabel
@onready var typing_sound = $typingsound

var full_text := "You are a custom's agent. 
Your task is to either deny or accept the entries.
Follow the information to do so.."
var char_index := 0
var speed := 0.05  # segundos entre letras

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_label.text = ""
	typing_sound.play()
	write_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func write_text():
	while char_index < full_text.length():
		text_label.text += full_text[char_index]
		char_index += 1
		
		# Reproducir el sonido
		
		await get_tree().create_timer(speed).timeout
	$Timer.start()
	
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
	elif Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
