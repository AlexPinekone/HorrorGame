extends State
class_name showresult

@onready var game_manager: Node3D = $"../.."
@onready var player: Player = $"../../../Physic/player"
@onready var text_box: CanvasLayer = $"../../../TextBox"

var isMT = false;

func Enter():
	if(Singleton.evilBall):
		player.show_ball_black()
	else:
		player.show_ball_white()
	await get_tree().create_timer(2).timeout
	text_box.queue_text("It looks like you took a black one")
	text_box.queue_text("Bad luck, kiddo")
	text_box.queue_text("But, we can do something about it")
	text_box.queue_text("For a price, sure")
	

func Exit():
	pass

func Update(_delta: float):
	
	await get_tree().create_timer(2.1).timeout
	if Input.is_action_just_pressed("interact") && text_box.get_finished():
		game_manager.switch_particles()
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		game_manager.switch_particles()
		player.hide_ball()
		player.hide_f_indice()
		player.red_indice()
		Singleton.state = Singleton.State.box
		Singleton.fingers.erase(Singleton.Fingers.indice)
		Transitioned.emit(self, "INTRO_PLAY")

func PhysicsUpdate(_delta: float):
	pass
