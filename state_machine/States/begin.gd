extends State
class_name begin

@onready var state_machine: Node = $".."

func Enter():
	pass
	
func Exit():
	pass

func Update(delta: float):
	if (Singleton.State.box == Singleton.state):
		Transitioned.emit(self, "TUTORIAL")
	
func PhysicsUpdate(_delta):
	pass
