extends Node2D


func _ready() -> void:
	var p = get_viewport_rect().size

func _process(delta: float) -> void:
	pass
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
