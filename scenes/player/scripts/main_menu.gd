extends Control

func _ready() -> void:
	Singleton.default_values()

func _process(delta: float) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
