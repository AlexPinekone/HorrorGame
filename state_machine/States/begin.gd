extends State
class_name EnemyIdle

@onready var text_box: CanvasLayer = $"../TextBox"
@onready var player: Player = $"../player"

enum dialogs {
	REST,
	D1,
	D2,
	D3
}

var current_dialog = dialogs.D1

func Enter():
	Singleton.ban_fin_texto = false

func Update(delta: float):
	if Singleton.state == Singleton.State.box:
		
		if current_dialog == dialogs.REST && Singleton.ban_fin_texto:
			player.normal_ray_cast()
		
		match current_dialog:
			dialogs.D1:
				if !Singleton.ban_fin_texto:
					text_box.queue_text("Hey, kid");
					text_box.queue_text("You already know how this works");
					text_box.queue_text("You put your hand in my box");
					player.up_ray_cast()
					current_dialog = dialogs.REST
	
func PhysicsUpdate(_delta):
	pass
