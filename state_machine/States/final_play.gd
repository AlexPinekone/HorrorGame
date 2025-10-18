extends State
class_name final_play

@onready var game_manager: Node3D = $"../.."
@onready var player: Player = $"../../../Physic/player"
@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var sound_machine: Node = $"../../Sound Machine"

var isMT = false
var uhOh = false
var gtfo = false
var exit = true
var banfinger = true

func Enter():
	banfinger = true
	if(Singleton.evilBall):
		player.show_ball_black()
		await get_tree().create_timer(2).timeout
		text_box.queue_text("Bad luck, buddy")
		text_box.queue_text("Let's try it once again")
	else:
		player.show_ball_white()
		await get_tree().create_timer(2).timeout
		text_box.queue_text("Hmmm")
		text_box.queue_text("Not bad")
		text_box.queue_text("You got lucky")
		text_box.queue_text("...")
		text_box.queue_text("...")
		text_box.queue_text("...")
		text_box.queue_text("...")
		text_box.queue_text("...")
		text_box.queue_text("Leave")
		gtfo = true
	await get_tree().create_timer(2).timeout
	
	

func Exit():
	pass

func Update(_delta: float):
	
	await get_tree().create_timer(2.1).timeout
	if Input.is_action_just_pressed("interact") && text_box.get_finished() && !gtfo && banfinger:
		banfinger = false
		game_manager.switch_particles()
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		game_manager.switch_particles()
		player.hide_ball()
		
		match (Singleton.fingers.size()):
			0:
				uhOh = true
			1:
				sound_machine.blood_play()
				player.hide_f_pulgar()
				player.red_pulgar()
				Singleton.fingers.erase(Singleton.Fingers.pulgar)
			2:
				sound_machine.blood_play()
				player.hide_f_menique()
				player.red_menique()
				Singleton.fingers.erase(Singleton.Fingers.menique)
			3:
				sound_machine.blood_play()
				player.hide_f_anular()
				player.red_anular()
				Singleton.fingers.erase(Singleton.Fingers.anular)
			4:
				sound_machine.blood_play()
				player.hide_f_medio()
				player.red_medio()
				Singleton.fingers.erase(Singleton.Fingers.medio)
				
		if (!uhOh):
			Singleton.state = Singleton.State.box
			Transitioned.emit(self, "INTRO_PLAY")
		else:
			game_manager.start_blink()
			await get_tree().create_timer(0.5).timeout
			Singleton.gameoverflag = true
			Singleton.state = Singleton.State.normal
			Transitioned.emit(self, "GAMEOVER")
			
	if gtfo && exit:
		exit = false
		game_manager.start_blink()
		await get_tree().create_timer(0.5).timeout
		Singleton.gameoverflag = true
		Singleton.state = Singleton.State.normal
		Transitioned.emit(self, "GAMEOVER")
		await get_tree().create_timer(1).timeout
	
func PhysicsUpdate(_delta: float):
	pass
