extends Node2D

@onready var car: Sprite2D = $Car01

var target= Vector2(0,0)

func _ready() -> void:
	car.look_at(target)

func _draw():
	draw_circle(target, 10, Color.RED, true);
	car.look_at(target)
	car.rotate(PI/2)

func _process(delta: float) -> void:
	pass


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		target=get_local_mouse_position()
		queue_redraw()
