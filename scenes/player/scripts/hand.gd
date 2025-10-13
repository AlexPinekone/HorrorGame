extends Node3D

@onready var head: Node3D = $"../head"
@onready var animation_blink: AnimationPlayer = $"../AnimationBlink"
@onready var palma: MeshInstance3D = $palma

var sensi = 0.2
var primera = true
	
func _input(event: InputEvent) -> void:
	#Oculta parte del modelo
	#palma.visible = false
	#Cambiar la textura
	if Singleton.State.ball == Singleton.state:
		if (primera):
			#Espera animación de parpadeo
			await get_tree().create_timer(0.5).timeout
			position.x = Singleton.mid_x
			position.z = Singleton.box_max_z
			primera = false
		else:
			if event is InputEventMouseMotion:
				
				position.x += event.relative.x * Singleton.sensitivity/200
				position.x = clamp(position.x, Singleton.box_min_x, Singleton.box_max_x)
				position.z += event.relative.y * Singleton.sensitivity/200
				position.z = clamp(position.z, Singleton.box_min_z, Singleton.box_max_z_i)
					
				if (position.x >= Singleton.right_ul[0] && position.x <= Singleton.right_dr[0] && position.z <= Singleton.right_ul[1] && position.z >= Singleton.right_dr[1]):
					Singleton.cont += 1
					head.start_shake(0.05)
					print("Okay x: ", position.x)
					print("Okay z: ", position.z)
				
			if Input.is_action_just_pressed("interact"):
				head.label_blank()
				#print("POSICIÓN ACTUAL: ", position.x, " , ", position.z)
				#&& position.z < Singleton.box_max_z
				if (position.x >= Singleton.right_ul[0] && position.x <= Singleton.right_dr[0] && position.z <= Singleton.right_ul[1] && position.z >= Singleton.right_dr[1]):
					print("Aqui!!! ", Singleton.cont)
					#print("Num: ", Singleton.right)
					#print("Con: (", Singleton.right_ul, " , ", Singleton.right_dr, ")")
					#Singleton.cont += 1
					if (Singleton.fingers.size() == 5):
						Singleton.evilBall = true
					else:
						Singleton.evilBall = false
				else:
					Singleton.evilBall = true
				##Animation/Transition
				animation_blink.play("blink")
				await get_tree().create_timer(0.5).timeout
				position = Vector3(0.818429, 0.345356, -0.84909)
				Singleton.state = Singleton.State.showhand
				
