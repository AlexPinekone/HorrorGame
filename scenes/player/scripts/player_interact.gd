extends RayCast3D

@onready var animation_blink: AnimationPlayer = $"../../AnimationBlink"
@onready var head: Node3D = $".."


func _physics_process(_delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		
		if hit.name == "door":
			head.label_open()
		elif hit.name == "silla":
			head.label_sit()
		elif hit.name == "ball":
			head.label_hand()
			#Luego cuando hay que tomar la bola
		else:
			head.label_blank()
		
		if hit.name == "door" && Input.is_action_just_pressed("interact"):
			Singleton.state = Singleton.State.door
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().get_parent().toogle_door()
				animation_blink.play("blink")
				
		if hit.name == "silla" && Input.is_action_just_pressed("interact") && !Singleton.gameoverflag:
			Singleton.state = Singleton.State.box
			
		if hit.name == "ball" && Input.is_action_just_pressed("interact"):
			Singleton.state = Singleton.State.ball
			
	else:
		if(Singleton.state != Singleton.State.ball):
			head.label_blank()		
