extends Node

onready var path = $enemies
onready var spawnCooldown = 0.5
onready var hordeInterval = 3
onready var lastSpawn = 0

var mineiro = preload("res://nodes/enemies/mineiro.tscn")
var follow = preload("res://nodes/enemies/follow.tscn")

func _ready():
	spawnMineiro()
	pass

func _process(delta):
	pass

func spawnMineiro():
	var newPathFollow = follow.instance()
	path.add_child(newPathFollow)
	var newMin = mineiro.instance()
	newPathFollow.add_child(newMin)