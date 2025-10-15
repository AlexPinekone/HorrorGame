extends Node

@onready var badspeak: AudioStreamPlayer3D = $badspeak
@onready var blood: AudioStreamPlayer3D = $blood
@onready var pickup: AudioStreamPlayer3D = $pickup
@onready var sitdown: AudioStreamPlayer3D = $sitdown
@onready var thud: AudioStreamPlayer3D = $thud
@onready var metalrun: AudioStreamPlayer3D = $metalrun
@onready var suspence: AudioStreamPlayer3D = $suspence
@onready var door: AudioStreamPlayer3D = $door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func badspeak_play():
	badspeak.play()

func blood_play():
	blood.play(0.5)
	
func pickup_play():
	pickup.play()
	
func sitdown_play():
	sitdown.play()
	
func thud_play():
	thud.play()
	
func door_play():
	door.play()
	
func metalrun_play():
	metalrun.play()

func metalrun_stop():
	metalrun.stop()
	
func suspence_play():
	suspence.play()
