extends CanvasLayer

@onready var label: Label = $MarginContainer/VBoxContainer/Label

func _ready() -> void:
	label_blank()

func label_sit():
	label.text = "Sit"

func label_blank():
	label.text = ""
	
func label_take():
	label.text = "Take"
	
func label_hand():
	label.text = "Put hand inside"
	
func label_open():
	label.text = "Use"
