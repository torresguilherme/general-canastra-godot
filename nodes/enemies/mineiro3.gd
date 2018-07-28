extends Spatial

var hp = 5
var speed = 0.7
onready var anim = $root/AnimationPlayer

func _ready():
	anim.get_animation("mineiro_correr").loop = true
	anim.play("mineiro_correr")
	pass
