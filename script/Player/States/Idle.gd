# idle.gd
extends PlayerState

func enter(_msg := {}) -> void:
	player.play("stand1")
	player.velocity = Vector2.ZERO
	
func physics_update(_delta):
	if not player.is_on_floor():
		state_machine.transition_to("Jump")
		return
		
	if Input.is_action_just_pressed("Jump"):
		state_machine.transition_to("Jump", {do_jump = true})
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		state_machine.transition_to("Walk")
	
	
