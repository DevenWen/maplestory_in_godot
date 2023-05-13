# Walk.gd
extends PlayerState
	
	
func enter(_msg := {}) -> void:
	player.play("walk1")
	
func physics_update(_delta):
	if not player.is_on_floor():
		state_machine.transition_to("Jump")
		return
		
	var input_direction_x = (
		Input.get_action_strength("Right")
		- Input.get_action_strength("Left")
	)
	
	if (input_direction_x != 0):
		player.set_flip(input_direction_x > 0)
	player.velocity.x = player.move_speed * input_direction_x
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Jump"):
		state_machine.transition_to("Jump", {do_jump = true})
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")
