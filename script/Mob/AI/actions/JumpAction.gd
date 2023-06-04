# JumpAction
extends ActionLeaf
class_name JumpActionLeaf

func tick(actor: Node, blackboard: Blackboard):
	var state_machine = actor.state_machine
	if state_machine.state.is_running():
		if state_machine.state.name == "Jump":
			return RUNNING
		else:
			return FAILURE
	
	# 触发 actor 移动
	state_machine.transition_to("Jump", {do_jump = true})
	return SUCCESS
	

