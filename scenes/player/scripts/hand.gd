extends Node3D

var sensi = 0.2
var primera = true
	
func _input(event: InputEvent) -> void:
	if Singleton.State.ball == Singleton.state:
		if event is InputEventMouseMotion:
			#if primera:
			#	position.x = 0.16
			#	position.z = 0.86
			position.x += event.relative.x * Singleton.sensitivity/200
			position.x = clamp(position.x, 0, 0.18)
			position.z += event.relative.y * Singleton.sensitivity/200
			position.z = clamp(position.z, -1.1627, -0.3037)
