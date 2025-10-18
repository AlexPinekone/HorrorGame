extends Control

func _ready() -> void:
	Singleton.default_values()

func _process(delta: float) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_link_button_pressed() -> void:
	OS.shell_open("https://sketchfab.com/scribbletoad")


func _on_music_button_pressed() -> void:
	OS.shell_open("https://freesound.org/people/Setuniman/sounds/352752/")
