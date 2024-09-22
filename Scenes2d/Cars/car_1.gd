extends Node2D

@onready var icon: Sprite2D = $Icon

@export var speed = 3
@export var is_moving=false

@onready var car: Sprite2D = $car

var position_counter:int=0
var current_pos: Vector2
var next_pos:Vector2
var path_pts:Array
var path_counter=0
var dir:Vector2
var reached=true

func _ready() -> void:
	reset()
	SignalManager.start_simulation.connect(start_simulation)
	SignalManager.clear_path.connect(reset)
	SignalManager.reached_target.connect(reached_target)

func reached_target():
	if(position_counter > len(path_pts)-1):
		return
	else:
		start_simulation(true)

func reset():
	is_moving=false
	position = Vector2.ZERO+Vector2(25,25)
	position_counter=0
	car.look_at(Vector2(0,100))
	
	
func orient_car():
	dir = Vector2.ZERO
	dir = (next_pos-current_pos) / dist_to_next()
	car.look_at(next_pos)
	car.rotate(PI/2)

func dist_to_next():
	return current_pos.distance_to(next_pos)

func start_simulation(is_moving_):
	is_moving=is_moving_
	path_pts = DataManager.get_path_points()
	current_pos = position
	next_pos = path_pts[position_counter] + Vector2(50,50)
	orient_car()
	is_moving=true

func _physics_process(delta: float) -> void:
	if is_moving:
		position.x += dir.x * speed
		position.y += dir.y * speed
		current_pos=position
		var d = dist_to_next()
		if dist_to_next() < 20:
			position_counter+=1
			is_moving=false
			SignalManager.reached_target.emit()
			
	
