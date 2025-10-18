extends State
class_name showresult

@onready var game_manager: Node3D = $"../.."
@onready var player: Player = $"../../../Physic/player"
@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var sound_machine: Node = $"../../Sound Machine"

var isMT = false;
var first = true

func Enter():
	if(Singleton.evilBall):
		player.show_ball_black()
	else:
		player.show_ball_white()
	await get_tree().create_timer(2).timeout
	text_box.queue_text("I see")
	text_box.queue_text("A black one")
	text_box.queue_text("Bad luck, pal")
	text_box.queue_text("However, I can do something about it")
	text_box.queue_text("How about another attempt?")
	text_box.queue_text("For a price. Of course")
	

func Exit():
	pass

func Update(_delta: float):
	
	await get_tree().create_timer(2.1).timeout
	if Input.is_action_just_pressed("interact") && text_box.get_finished() && first:
		first = false
		game_manager.switch_particles()
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		sound_machine.blood_play()
		game_manager.switch_particles()
		player.hide_ball()
		player.hide_f_indice()
		player.red_indice()
		Singleton.state = Singleton.State.box
		Singleton.fingers.erase(Singleton.Fingers.indice)
		Transitioned.emit(self, "INTRO_PLAY")

func PhysicsUpdate(_delta: float):
	pass
