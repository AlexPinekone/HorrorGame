extends Node3D

@onready var box: Node3D = $"../Physic/Objects/box"
@onready var player: Player = $"../Physic/player"
@onready var gpu_particles_3d: GPUParticles3D = $"../Partilcle/GPUParticles3D"

func _ready() -> void:
	Singleton.default_values()

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
	
func move_chair_out():
	if !Singleton.gameoverflag:
		player.position = Vector3(1.6, 2.78, 0.0)
		for nodo_silla in get_tree().get_nodes_in_group("silla"):
			nodo_silla.position = Vector3(1.8,nodo_silla.position.y,nodo_silla.position.z)
			
func move_chair_in():
	player.position = Vector3(3.045, 2.78, 0.0)
	for nodo_silla in get_tree().get_nodes_in_group("silla"):
		nodo_silla.position = Vector3(1.012,nodo_silla.position.y,nodo_silla.position.z)

func switch_particles():
	gpu_particles_3d.emitting = !gpu_particles_3d.emitting
