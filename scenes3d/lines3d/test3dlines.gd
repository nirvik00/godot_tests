@tool
extends Node3D

@export var update= false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	draw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func point(pos:Vector3):
	var mesh_instance=MeshInstance3D.new()
	var mat = ORMMaterial3D.new()
	mat.albedo_color=Color.RED
	
	var sphere= SphereMesh.new()
	sphere.radius=0.25
	sphere.height=0.5
	sphere.material = mat
	
	mesh_instance.mesh = sphere
	mesh_instance.position = pos
	add_child(mesh_instance)

func draw_srf():
	var mat = ORMMaterial3D.new()
	mat.albedo_color=Color.GREEN
	
	var mesh = MeshInstance3D.new()
	var vertices = PackedVector3Array([
		Vector3(0,0,0),
		Vector3(1,0,0),
		Vector3(1,0,1),
	])
	var indices = PackedInt32Array([
		0,1,2
	])
	
	var array =[]
	array.resize(Mesh.ARRAY_MAX)
	array[Mesh.ARRAY_VERTEX] = vertices
	array[Mesh.ARRAY_INDEX] = indices
	
	var array_mesh = ArrayMesh.new()
	array_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, array)
	mesh.mesh = array_mesh
	add_child(mesh)
	

func draw():
	point(Vector3(0,0.5,0))
	draw_srf()

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
