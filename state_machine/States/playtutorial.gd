extends State
class_name playtutorial

@onready var game_manager: Node3D = $"../.."

func Enter():
	game_manager.start_blink()
	game_manager.up_ray_cast()

func Exit():
	game_manager.hide_box()
	game_manager.normal_ray_cast()

func Update(_delta: float):
	if (Singleton.state == Singleton.State.showhand):
		Transitioned.emit(self, "SHOWRESULT")

func PhysicsUpdate(_delta: float):
	pass
