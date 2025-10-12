extends CanvasLayer

const CHAR_READ_RATE = 0.1

@onready var textbox_container = $TextBoxContainer
@onready var start_symbol = $TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextBoxContainer/MarginContainer/HBoxContainer/End
@onready var label: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Label

var tween : Tween

enum textState {
	READY,
	READING,
	FINISHED
}

var current_state = textState.READY
var text_queue = []

func _ready() -> void:
	print("Starting state: READY")
	hide_textbox()
	#queue_text("This is the first text")

func _process(_delta: float) -> void:
	match current_state:
		textState.READY:
			if !text_queue.is_empty():
				display_text()
		textState.READING:
			if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("interact"):
				label.visible_ratio = 1.0
				#v
				end_symbol.text = ""
				tween.stop()
				change_state(textState.FINISHED)
		textState.FINISHED:
			if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("interact"):
				change_state(textState.READY)
				if(text_queue.is_empty()):
					Singleton.ban_fin_texto = true
					hide_textbox()
				
func queue_text(next_text):
	Singleton.ban_fin_texto = false
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	
func show_text_box():
	start_symbol.text = "-"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	change_state(textState.READING)
	show_text_box()
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1 , len(next_text) * CHAR_READ_RATE).from(0).finished
	tween.connect("finished", on_tween_finished)
	
func on_tween_finished():
	#v
	end_symbol.text = ""
	change_state(textState.FINISHED)
	
func change_state(next_state):
	current_state = next_state
	match current_state:
		textState.READY:
			#print("Changing state to: READY")
			pass
		textState.READING:
			#print("Changing state to: READING")
			pass
		textState.FINISHED:
			#print("Changing state to: FINISHED")
			pass
