extends RayCast3D

@onready var animation_blink: AnimationPlayer = $"../../AnimationBlink"

func _physics_process(_delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		if hit.name == "door":
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().get_parent().toogle_door()
				animation_blink.play("blink")
