extends Spatial

var reach = 20
var target = null

var bullet = preload("res://nodes/towers/bullet.tscn")
var shotCooldown = 1.5
var lastShot = 0

func _ready():
	pass

func _process(delta):
	if target == null:
		target = pickTarget()
	else:
		look_at(target.global_transform.origin, Vector3(0, 1, 0))
		rotate_y(deg2rad(180))
		if global_transform.origin.distance_to(target.global_transform.origin) > reach:
			target = null
		if lastShot <= 0:
			$AnimationPlayer.play("estilingue_atirar")
			lastShot = shotCooldown
	if lastShot > 0:
		lastShot -= delta

func pickTarget():
	var ret = null
	var enemies = $"../../../enemies"
	for i in enemies.get_children():
		if global_transform.origin.distance_to(i.get_children()[0].global_transform.origin) < reach:
			ret = i.get_children()[0]
			break
	return ret

func shoot():
	if target != null:
		var newBullet = bullet.instance()
		newBullet.translation = Vector3(0, 1, 0)
		newBullet.target = target
		add_child(newBullet)
		print("shoot")