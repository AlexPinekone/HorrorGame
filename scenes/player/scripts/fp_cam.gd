extends Node3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if Singleton.state == Singleton.State.normal:
		if event is InputEventMouseMotion:
			get_parent().rotate_y(deg_to_rad(-event.relative.x * Singleton.sensitivity))
			rotate_x(deg_to_rad(-event.relative.y * Singleton.sensitivity))
			rotation.x = clamp(rotation.x, deg_to_rad(-45), deg_to_rad(90))
			
	if Singleton.state == Singleton.State.box:
		if event is InputEventMouseMotion:
			get_parent().rotate_y(deg_to_rad(-event.relative.x * Singleton.sensitivity))
			get_parent().rotation.y = clamp(get_parent().rotation.y, deg_to_rad(45), deg_to_rad(135))
			rotate_x(deg_to_rad(-event.relative.y * Singleton.sensitivity))
			rotation.x = clamp(rotation.x, deg_to_rad(-45), deg_to_rad(50))
			
	if Singleton.state == Singleton.State.ball:
		if event is InputEventMouseMotion:
			get_parent().rotate_y(deg_to_rad(-event.relative.x * Singleton.sensitivity))
			get_parent().rotation.y = clamp(get_parent().rotation.y, deg_to_rad(90), deg_to_rad(90))
			rotate_x(deg_to_rad(-event.relative.y * Singleton.sensitivity))
			rotation.x = clamp(rotation.x, deg_to_rad(-45), deg_to_rad(-45))
			
