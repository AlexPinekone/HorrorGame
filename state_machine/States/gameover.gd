extends State
class_name gameover

@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var game_manager: Node3D = $"../.."
@onready var player: Player = $"../../../Physic/player"
@onready var sound_machine: Node = $"../../Sound Machine"

var banFin = true
var banFirst = true

func Enter():
	Singleton.state = Singleton.State.normal
	game_manager.move_chair_in()
	game_manager.up_ray_cast()
	await get_tree().create_timer(2).timeout
	text_box.queue_text("Goodbye")
	

func Update(_delta: float):
	if Singleton.ban_fin_texto:
		game_manager.normal_ray_cast()
	if (Singleton.end == true && banFirst):
		banFirst = false
		player.show_hide_screen()
		sound_machine.door_play()
		await get_tree().create_timer(1.79).timeout
		sound_machine.metalrun_play()
		await get_tree().create_timer(4).timeout
		sound_machine.metalrun_stop()
		sound_machine.blood_play()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		#Cambio de escena
	if (Singleton.fingers.size() == 0 && banFin && Singleton.evilBall == true):
		banFin = false
		await get_tree().create_timer(3).timeout
		player.show_hide_screen()
		sound_machine.suspence_play()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		#Cambio de escena
	
func PhysicsUpdate(_delta):
	pass
