extends PathFollow

func _ready():
	pass

func _process(delta):
	offset += delta * get_children()[0].speed * 4