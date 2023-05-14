extends State

class_name PlayerState

var player: Charactor

func _ready():
	player = owner as Charactor
	assert(player != null)
