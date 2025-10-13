extends State
class_name gameover

@onready var text_box: CanvasLayer = $"../../../TextBox"
@onready var game_manager: Node3D = $"../.."

func Enter():
	Singleton.state = Singleton.State.normal
	game_manager.move_chair_in()
	game_manager.up_ray_cast()
	await get_tree().create_timer(2).timeout
	text_box.queue_text("GAME OVER")
	

func Update(delta: float):
	if Singleton.ban_fin_texto:
		game_manager.normal_ray_cast()
	
func PhysicsUpdate(_delta):
	pass
