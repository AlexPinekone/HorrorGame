extends State
class_name intro_play

@onready var game_manager: Node3D = $"../.."
@onready var text_box: CanvasLayer = $"../../../TextBox"

func Enter():
	game_manager.show_box()
	game_manager.up_ray_cast()
	await get_tree().create_timer(1).timeout
	text_box.queue_text("You have another chance")
	text_box.queue_text("Go on")

func Exit():
	pass

func Update(_delta: float):
	await get_tree().create_timer(3).timeout
	if Singleton.ban_fin_texto:
		Singleton.ban_fin_texto = false
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		Singleton.primera = true
		game_manager.normal_ray_cast()
		Singleton.state = Singleton.State.ball
		Transitioned.emit(self, "MIDDLE_PLAY")

func PhysicsUpdate(_delta: float):
	pass
