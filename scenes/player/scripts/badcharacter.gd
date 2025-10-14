extends CharacterBody3D

@onready var player: Player = $"../Physic/player"
@onready var skeleton: Skeleton3D = $rig/Skeleton3D


func _process(_delta):
	var head_bone = skeleton.find_bone("DEF-spine.005")
	if head_bone == -1:
		print("Not found")
		return
		
	var head_pos = skeleton.get_bone_global_pose(head_bone).origin
	var target = player.global_transform.origin
	target.y = head_pos.y  # evitar mirar hacia arriba/abajo exagerado

	var look_dir = (target - head_pos).normalized()
	var new_basis = Basis.looking_at(look_dir, Vector3.UP)
	
	var offset_rotation = Vector3(0, deg_to_rad(150), deg_to_rad(3)) # horizontal + leve inclinación
	new_basis = Basis.from_euler(new_basis.get_euler() + offset_rotation)
	
	skeleton.set_bone_global_pose_override(head_bone, Transform3D(new_basis, head_pos), 1, true)
