extends Spatial

var hp = 3
var speed = 1.3
onready var anim = $root/AnimationPlayer

func _ready():
	anim.get_animation("mineiro_correr").loop = true
	anim.play("mineiro_correr")
	pass
