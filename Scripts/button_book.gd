extends MarginContainer

@export var shrink_scale: float = 0.95
@export var anim_duration: float = 0.1

var tween: Tween = null
var center_pivot: Vector2

func _on_texture_button_book_button_down() -> void:
	var new_scale = Vector2(shrink_scale, shrink_scale)
	
	if tween:
		tween.kill()

	tween = create_tween()	
	tween.tween_property(self, "scale", new_scale, anim_duration).set_ease(Tween.EASE_OUT)


func _on_texture_button_book_button_up() -> void:
	if tween:
		tween.kill()	
	
	tween = create_tween()	
	tween.tween_property(self, "scale", Vector2.ONE, anim_duration).set_ease(Tween.EASE_OUT)
