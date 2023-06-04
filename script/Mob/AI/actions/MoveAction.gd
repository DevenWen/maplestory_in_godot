# MoveAction
extends ActionLeaf
class_name MoveActionLeaf

func tick(actor: Node, blackboard: Blackboard):
	var state_machine = actor.state_machine
	if state_machine.state.is_running():
		if state_machine.state.name == "Move":
			return RUNNING
		else:
			return FAILURE
	
	# 触发 actor 移动
	state_machine.transition_to("Move")
	return SUCCESS
