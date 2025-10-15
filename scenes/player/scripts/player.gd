extends CharacterBody3D
class_name Player

@onready var hide_screen: MeshInstance3D = $head/hide_screen
@onready var ray_cast_3d: RayCast3D = $head/RayCast3D
@onready var animation_blink: AnimationPlayer = $AnimationBlink
@onready var game_manager: Node3D = $"../../GameManager"
@onready var footsteps: AudioStreamPlayer3D = $footsteps
@onready var interaction: CanvasLayer = $head/CanvasLayer
var step_timer = 0.0
@export var bbeg: CharacterBody3D

#Just the ball
@onready var ball: MeshInstance3D = $thehand/ball
#The hole hand model
@onready var thehand: Node3D = $thehand
#Fingers
@onready var menique: MeshInstance3D = $thehand/menique
@onready var anular: MeshInstance3D = $thehand/anular
@onready var medio: MeshInstance3D = $thehand/medio
@onready var indice: MeshInstance3D = $thehand/indice
@onready var pulgar: MeshInstance3D = $thehand/pulgar
#Knuckles
@onready var n_menique: MeshInstance3D = $thehand/n_menique
@onready var n_indice: MeshInstance3D = $thehand/n_indice
@onready var n_medio: MeshInstance3D = $thehand/n_medio
@onready var n_anular: MeshInstance3D = $thehand/n_anular
@onready var n_pulgar: MeshInstance3D = $thehand/n_pulgar

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	BackgroundMachine.play_background()

func _process(delta):
	var is_moving = abs(velocity.x) > 0.1 or abs(velocity.y) > 0.1
	if is_moving && Singleton.state != Singleton.State.ball:
		step_timer -= delta
		if step_timer <= 0.0:
			footsteps.play()
			step_timer = 0.4  # tiempo entre pasos (ajusta según velocidad)
	else:
		footsteps.stop()

func _physics_process(_delta: float) -> void:
	if Singleton.state == Singleton.State.normal:
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	
	if (Singleton.state == Singleton.State.box || Singleton.state == Singleton.State.showhand) && !Singleton.gameoverflag:
		footsteps.stop()
		game_manager.move_chair_out()
	
	if Singleton.gameoverflag:
		Singleton.state = Singleton.State.normal
		if(Singleton.fingers.size() == 0):
			invisible_interaction()
		
	if (Singleton.state == Singleton.State.ball) && Singleton.primera:
		footsteps.stop()
		Singleton.primera = false
		await get_tree().create_timer(0.5).timeout
		center_hand()

func center_hand():
	thehand.position.x = Singleton.mid_x
	thehand.position.z = Singleton.box_max_z

func normal_ray_cast():
	ray_cast_3d.rotation = Vector3(deg_to_rad(90), ray_cast_3d.rotation.y, ray_cast_3d.rotation.z)

func up_ray_cast():
	ray_cast_3d.rotation = Vector3(deg_to_rad(180), ray_cast_3d.rotation.y, ray_cast_3d.rotation.z)

func start_blink():
	animation_blink.play("blink")
	
func show_ball_black():
	ball.material_override = preload("uid://cg6mgsd6r57ri")
	thehand.rotation = Vector3(thehand.rotation.x, thehand.rotation.y , deg_to_rad(170))

func show_ball_white():
	ball.material_override = preload("uid://dpagjyfvobv2t")
	thehand.rotation = Vector3(thehand.rotation.x, thehand.rotation.y , deg_to_rad(170))
	
func hide_ball():
	thehand.rotation = Vector3(thehand.rotation.x, thehand.rotation.y , deg_to_rad(0))
	
func hide_f_indice():
	indice.visible = false
	
func hide_f_menique():
	menique.visible = false
	
func hide_f_anular():
	anular.visible = false
	
func hide_f_medio():
	medio.visible = false
	
func hide_f_pulgar():
	pulgar.visible = false

func red_indice():
	n_indice.material_override = preload("uid://vsxac7kt7h00")
	
func red_menique():
	n_menique.material_override = preload("uid://vsxac7kt7h00")
	
func red_medio():
	n_medio.material_override = preload("uid://vsxac7kt7h00")
	
func red_anular():
	n_anular.material_override = preload("uid://vsxac7kt7h00")
	
func red_pulgar():
	n_pulgar.material_override = preload("uid://vsxac7kt7h00")
	
func hide_hide_screen():
	hide_screen.position = Vector3(0.077, 1.305, -0.395)

func show_hide_screen():
	hide_screen.position = Vector3(0.077, -0.035, -0.395)
	
func invisible_interaction():
	interaction.hide()
	
func hide_bbeg():
	bbeg.visible = false
