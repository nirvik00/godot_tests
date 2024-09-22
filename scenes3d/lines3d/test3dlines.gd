extends Node3D

@export var update= false
@onready var height_label: Label = $CanvasLayer/VBoxContainer/height_label
@onready var h_slider: HSlider = $CanvasLayer/VBoxContainer/HSlider
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

var slider_changed= false

func _ready() -> void:
	var y=0.15
	var a = Vector3(0,y,0)
	var b = Vector3(1,y,0)
	var c = Vector3(1,y,1)
	
	#draw_srf()
	#draw_lines(a, b)
	#draw_lines(c, b)
	#draw_lines(a, c)
	
	mesh_instance_3d.scale.y =h_slider.value
	mesh_instance_3d.position.y=h_slider.value/2

func point(pos:Vector3, r=0.1):
	var mesh_instance=MeshInstance3D.new()
	var mat = ORMMaterial3D.new()
	mat.albedo_color=Color.RED
	
	var sphere= SphereMesh.new()
	sphere.radius= r
	sphere.height= 2*r
	sphere.material = mat
	
	mesh_instance.mesh = sphere
	mesh_instance.position = pos
	add_child(mesh_instance)

func draw_lines(a, b):
	var mesh_instance = MeshInstance3D.new()
	var immediate_mesh = ImmediateMesh.new()
	var mat = StandardMaterial3D.new()
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, mat)
	immediate_mesh.surface_add_vertex(a)
	immediate_mesh.surface_add_vertex(b)
	immediate_mesh.surface_end()
	mat.albedo_color=Color.BLACK
	mesh_instance.mesh = immediate_mesh
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
	for i in vertices:
		point(i)
	
	var array =[]
	array.resize(Mesh.ARRAY_MAX)
	array[Mesh.ARRAY_VERTEX] = vertices
	array[Mesh.ARRAY_INDEX] = indices
	
	var array_mesh = ArrayMesh.new()
	array_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, array)
	mesh.mesh = array_mesh
	add_child(mesh)
	

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	print("value = %s"%value_changed)
	if value_changed:
		slider_changed=true
		height_label.text = "height = " + str(h_slider.value)
		mesh_instance_3d.scale.y = h_slider.value
		mesh_instance_3d.position.y=h_slider.value/2
