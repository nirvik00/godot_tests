extends Node2D

@export var num_cells_hor=10
@export var num_cells_ver=10

var screen_width: float
var screen_height: float
var cell_width: float
var cell_height: float
var path_node_arr=[]
var allow_draw_path = false

var cell_arr= [] #  Vector2 []

func _ready() -> void:
	var v = get_viewport_rect().size
	screen_width = v.x
	screen_height=  v.y
	cell_width=screen_width/ num_cells_hor
	cell_height=screen_height/ num_cells_ver
	#
	SignalManager.draw_path.connect(draw_path)
	SignalManager.clear_path.connect(clear_path)
	SignalManager.set_path_and_run.connect(set_path_and_run)
	#
	draw_grid()

func set_path_and_run():
	DataManager.set_path(path_node_arr)
	SignalManager.start_simulation.emit(true) ##### emits start simulation and run
	
func draw_grid():
	for i in range(0, screen_width, cell_width):
		for j in range(0, screen_height-150, cell_height):
			var v = Vector2(i,j)
			if v not in cell_arr:
				cell_arr.append(Vector2(i, j))

func draw_path(t: bool):
	allow_draw_path = t

func clear_path():
	path_node_arr.clear()
	DataManager.reset()
	queue_redraw()
	print("num nodes = %s", len(path_node_arr))

func update_path():
	if len(path_node_arr)>0:
		queue_redraw()

func _process(_delta: float) -> void:
	pass

func find_pos_in_grid(p: Vector2):
	for cell in cell_arr:
		if p.x>cell.x && p.x<cell.x+cell_width:
			if p.y>cell.y && p.y<cell.y+cell_height:
				if cell not in path_node_arr:
					path_node_arr.append(cell)

func _draw():
	for cell in cell_arr:
		draw_rect(Rect2(cell.x, cell.y, cell_width, cell_height), Color(0,0,0,1.0), false, 1.0)
	
	for cell in path_node_arr:
		var r= 20
		draw_circle(Vector2(cell.x+cell_width/2, cell.y+cell_height/2), r, Color(200,0,0,1.0), true);
	
func _input(event):
	if event is InputEventMouseButton:
		find_pos_in_grid(event.position)
		update_path()
		
