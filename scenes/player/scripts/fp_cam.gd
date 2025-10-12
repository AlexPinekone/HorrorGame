extends Node3D

var shake_amount = 0.05
var shake_time = 0.5
var original_position

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	original_position = position

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
			
	if Singleton.state == Singleton.State.showhand:
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
			
			
func start_shake(duration=0.5):
	var amount = 0.014
	original_position = position
	var tween = create_tween()
	
	# Hacemos un shake simple en X y Y con loops
	for i in range(int(duration / 0.05)):
		tween.tween_property(self, "position:x", original_position.x + randf_range(-amount, amount), 0.1)
		tween.tween_property(self, "position:y", original_position.y + randf_range(-amount, amount), 0.1)
	
	# Al final, volvemos a la posición original
	tween.tween_property(self, "position", original_position, 0.05)
			
