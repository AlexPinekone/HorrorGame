extends Node

var cont = 0
var sensitivity = 0.2
var box_min_x = 0
var box_max_x = 0.18
var box_min_z = -1.1627
var box_max_z = -0.63
var box_max_z_i = -0.3037
var mid_x
var mid_z
var right_ul
var right_dr
var right

enum State {normal, box, ball, door, showhand}

var state := State.normal

var ban_fin_texto = false

func _ready() -> void:
	var mx = (box_max_x - box_min_x)/2
	var mz = (box_max_z - box_min_z)/2
	mid_x = box_min_x + mx
	mid_z = box_min_z + mz
	randomN()
	
func randomN() -> void:
	var random = RandomNumberGenerator.new()
	right = random.randi() % 4
	match right:
		1:
			right_ul = [box_min_x,box_max_z]
			right_dr = [mid_x,mid_z]
		2: 
			right_ul = [mid_x,box_max_z]
			right_dr = [box_max_x,mid_z]
		3: 
			right_ul = [box_min_x,mid_z]
			right_dr = [mid_x,box_min_z]
		_: 
			right_ul = [mid_x,mid_z]
			right_dr = [box_max_x,box_min_z]

func generaBox() -> void:
	pass
	
	
