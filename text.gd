extends Label

var num_text: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".text = "Bon dia"
	$Timer.start()


func _on_timer_timeout() -> void:
	num_text += 1
	if num_text == 1:
		$".".text = "Tic tac"
	elif num_text == 2:
		$".".text = "Adeu"
	else: 
		$Timer.stop()
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
