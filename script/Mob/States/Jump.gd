extends MobState

func enter(_msg := {}) -> void:
	mob.play("jump")
	
func physics_update(_delta):
	if mob.is_on_floor():
		state_machine.transition_to("Idle")
