extends MobState
var finish_ts: int
var direction_x: int

func enter(_msg := {}) -> void:
	mob.play("move")
	finish_ts = Time.get_unix_time_from_system() + randi_range(1, 5)
	direction_x = randi_range(0, 1) 
	if direction_x == 0:
		direction_x = -1
	mob.set_flip(direction_x == 1)
	
func physics_update(_delta):
	# 随机方向移动 1s
	mob.velocity.x = mob.move_speed * direction_x
	mob.move_and_slide()
	
	if not is_running():
		state_machine.transition_to("Idle")
	
func is_running():
	return Time.get_unix_time_from_system() < finish_ts
