extends State
class_name tutorial

@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var game_manager: Node3D = $"../.."

func Enter():
	await get_tree().create_timer(1).timeout
	text_box.queue_text("Hey, kid")
	text_box.queue_text("You already know how this works")
	text_box.queue_text("Two balls, one black, one white")
	text_box.queue_text("Take the white one, and you can get out")
	text_box.queue_text("Take the black one, and you die")
	text_box.queue_text("Simple, right?")
	text_box.queue_text("Go on")
	game_manager.up_ray_cast()

func Update(delta: float):
	if Singleton.ban_fin_texto:
		game_manager.normal_ray_cast()
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		Transitioned.emit(self, "SHOWBOX")
	
func PhysicsUpdate(_delta):
	pass
