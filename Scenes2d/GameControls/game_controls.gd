extends Control


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	
#func _on_start_button_pressed() -> void:
	#SignalManager.start_simulation.emit(true)
	
#func _on_stop_button_pressed() -> void:
	#SignalManager.start_simulation.emit(false)

func _on_clear_path_pressed() -> void:
	SignalManager.clear_path.emit()

func _on_set_path_pressed() -> void:
	SignalManager.set_path_and_run.emit()
