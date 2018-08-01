extends Area

var target = null
var speed = 15

func _ready():
	pass

func _process(delta):
	if target.hp <= 0:
		queue_free()
	var direction = (target.global_transform.origin - global_transform.origin).normalized()
	global_transform.origin += direction * speed * delta

func _on_bullet_area_entered(area):
	if area.get_parent() == target:
		target.hp -= 1
		queue_free()
