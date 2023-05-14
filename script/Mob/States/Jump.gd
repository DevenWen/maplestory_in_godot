extends MobState

func enter(msg := {}) -> void:
	mob.play("jump")
	if msg.has("do_jump"):
		mob.velocity.y = - mob.jump_velocity
	
func physics_update(delta):
	mob.velocity.y += mob.gravity * delta
	mob.move_and_slide()
	
	if mob.is_on_floor():
		state_machine.transition_to("Idle", {down_floor = true})

func is_running():
	return true
