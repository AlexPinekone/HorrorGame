extends AudioStreamPlayer3D

@onready var background: AudioStreamPlayer3D = $"."

func play_background():
	background.play()
	
func stop_background():
	background.stop()
