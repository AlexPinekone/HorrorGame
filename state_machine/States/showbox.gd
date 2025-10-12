extends State
class_name showbox

@onready var game_manager: Node3D = $"../.."

func Enter():
	game_manager.show_box()

func Exit():
	pass

func Update(_delta: float):
	if(Singleton.state == Singleton.State.ball):
		Transitioned.emit(self, "PLAYTUTORIAL")

func PhysicsUpdate(_delta: float):
	pass
