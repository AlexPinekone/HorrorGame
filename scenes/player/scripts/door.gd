extends Node3D

var opened = false

func toogle_door():
	if $AnimationPlayer.current_animation != "open" and $AnimationPlayer.current_animation != "close":
		if !opened:
			$AnimationPlayer.play("open")
		if opened:
			$AnimationPlayer.play("close")
		opened = !opened
		pass
