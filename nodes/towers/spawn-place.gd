extends Spatial

var available = true
var mouseOn = false

var towers = [preload("res://nodes/towers/torre-sting.tscn"),
	preload("res://nodes/towers/torre-fondue.tscn"),
	preload("res://nodes/towers/torre-golem.tscn")]

enum types {STING, FONDUE, GOLEM}

func _ready():
	pass

func _on_StaticBody_mouse_entered():
	if available:
		mouseOn = true
		scale *= 1.3

func _on_StaticBody_mouse_exited():
	if available:
		scale /= 1.3
		mouseOn = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") && mouseOn:
		$interface/Control.visible = true
		for i in $interface/Control.get_children():
			i.pressed = false

func spawnTorre(type):
	var newTower = towers[type].instance()
	newTower.translation = Vector3()
	add_child(newTower)
	available = false
	$interface/Control.visible = false
	mouseOn = false

func _on_golem_pressed():
	spawnTorre(GOLEM)

func _on_fondue_pressed():
	spawnTorre(FONDUE)

func _on_sting_pressed():
	spawnTorre(STING)

func _on_quit_pressed():
	$interface/Control.visible = false
	mouseOn = false
