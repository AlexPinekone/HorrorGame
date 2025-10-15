extends State
class_name showbox

@onready var game_manager: Node3D = $"../.."
@onready var sound_machine: Node = $"../../Sound Machine"

func Enter():
	sound_machine.thud.play()
	game_manager.show_box()
	Singleton.primera = true

func Exit():
	pass

func Update(_delta: float):
	if(Singleton.state == Singleton.State.ball):
		Transitioned.emit(self, "PLAYTUTORIAL")

func PhysicsUpdate(_delta: float):
	pass
