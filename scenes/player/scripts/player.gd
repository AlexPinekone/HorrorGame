extends CharacterBody3D
class_name Player

@onready var ray_cast_3d: RayCast3D = $head/RayCast3D
var rotated_ray = false

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	
	if Singleton.state == Singleton.State.normal:
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	
	if Singleton.state == Singleton.State.box:
		position = Vector3(1.6, 2.78, 0.0)
		for nodo_silla in get_tree().get_nodes_in_group("silla"):
			nodo_silla.position = Vector3(1.8,nodo_silla.position.y,nodo_silla.position.z)

func normal_ray_cast():
	rotated_ray = false
	ray_cast_3d.rotation = Vector3(90, ray_cast_3d.rotation.y, ray_cast_3d.rotation.z)

func up_ray_cast():
	rotated_ray = true
	ray_cast_3d.rotation = Vector3(180, ray_cast_3d.rotation.y, ray_cast_3d.rotation.z)
		
