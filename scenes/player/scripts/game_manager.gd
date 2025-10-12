extends Node3D

@onready var box: Node3D = $"../Physic/Objects/box"
@onready var player: Player = $"../Physic/player"

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
		
func show_box():
	box.position = Vector3(0.558, 3.13, -0.032)
	
func hide_box():
	box.position = Vector3(0.558, 10.72, -0.032)
	
func up_ray_cast():
	player.up_ray_cast()

func normal_ray_cast():
	player.normal_ray_cast()
	
func start_blink():
	player.start_blink()
