extends MobState

var finish_ts: int

func enter(msg := {}) -> void:
	mob.play("stand")
	if not msg.has("down_floor"):
		finish_ts = Time.get_unix_time_from_system() + randi_range(1, 2)
	else:
		finish_ts = Time.get_unix_time_from_system() + randi_range(1, 5)
	
func physics_update(_delta):
	if not mob.is_on_floor():
		state_machine.transition_to("Jump")
		return
	
func is_running():
	return Time.get_unix_time_from_system() < finish_ts	
