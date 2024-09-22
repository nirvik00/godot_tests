extends Node

var grid_templates=["square_grid", "radial_grid"]
var block_template=["peripheral", "partition"]

var path_node_arr=[]

func add_path_point(p: Vector2):
	path_node_arr.append(p)
	
func set_path(pts):
	path_node_arr = pts
	
func get_path_points():
	return path_node_arr

func reset():
	path_node_arr=[]
