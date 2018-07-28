extends Camera

func _ready():
	look_at($"../cenario/plano".transform.origin, Vector3(0, 1, 0))
	pass
