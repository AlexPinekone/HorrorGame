extends State
class_name tutorial

@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var game_manager: Node3D = $"../.."
@onready var sound_machine: Node = $"../../Sound Machine"

func Enter():
	sound_machine.sitdown_play()
	await get_tree().create_timer(1).timeout
	text_box.queue_text("Hey, buddy")
	text_box.queue_text("You already know how this works")
	text_box.queue_text("The box has two balls")
	text_box.queue_text("If you take the black one, you die")
	text_box.queue_text("If you take the white one, I let you go")
	text_box.queue_text("Simple. Right?")
	text_box.queue_text("Go ahead")
	game_manager.up_ray_cast()

func Update(delta: float):
	if Singleton.ban_fin_texto:
		game_manager.normal_ray_cast()
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		Transitioned.emit(self, "SHOWBOX")
	
func PhysicsUpdate(_delta):
	pass
