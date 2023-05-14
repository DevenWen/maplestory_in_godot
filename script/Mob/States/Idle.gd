extends MobState

func enter(_msg := {}) -> void:
	mob.play("stand")
	
func physics_update(_delta):
	if not mob.is_on_floor():
		state_machine.transition_to("Jump")
		return
	
	
