extends Area

var target = null
var speed = 8

func _ready():
	pass

func _process(delta):
	translation += target.global_transform.origin * speed * delta

func _on_bullet_area_entered(area):
	if area.get_parent() == target:
		target.hp -= 1
