extends Spatial

var hp = 4
var speed = 1.0
onready var anim = $root/AnimationPlayer

func _ready():
	anim.get_animation("mineiro_correr").loop = true
	anim.play("mineiro_correr")

func _process(delta):
	if hp <= 0:
		# morre
		set_process(false)
		$"death-anim".play("death")
