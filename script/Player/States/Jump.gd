extends PlayerState

func enter(msg := {}):
	player.play("jump")
	if msg.has("do_jump"):
		player.velocity.y = - player.jump_velocity


func physics_update(delta: float):
	
	var input_direction_x = (
		Input.get_action_strength("Right")
		- Input.get_action_strength("Left")
	)
	
	if (input_direction_x != 0):
		player.set_flip(input_direction_x > 0)
	player.velocity.x = player.move_speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Walk")
	
	
