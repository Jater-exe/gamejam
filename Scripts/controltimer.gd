extends Control

func _ready():
	$Timer.start()

func _on_timer_timeout():
	print("Cambio de escena")
	get_tree().change_scene_to_file("res://Scenes/mouporta.tscn")
