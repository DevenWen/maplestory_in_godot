# JumpAction
extends ActionLeaf

func tick(actor: Node, blackboard: Blackboard):
	if actor.state.is_running():
		if actor.state.name == "Jump":
			return RUNNING
		else:
			return FAILURE
	
	# 触发 actor 移动
	actor.transition_to("Jump", {do_jump = true})
	return SUCCESS
	

