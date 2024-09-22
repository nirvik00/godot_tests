extends Camera3D

const speed=0.01

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.z += speed
	elif Input.is_action_pressed("down"):
		position.z -= speed
	elif Input.is_action_pressed("left"):
		position.x -= speed
	elif Input.is_action_pressed("right"):
		position.x += speed

func _input(event):
	if Input.is_key_pressed(KEY_Q):
		position.y += speed
	elif Input.is_key_pressed(KEY_E):
		position.y -= speed
	
	
