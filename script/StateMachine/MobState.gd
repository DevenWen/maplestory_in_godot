extends State

class_name MobState

var mob: Mob

func _ready():
	mob = owner as Mob
	assert(mob != null)
