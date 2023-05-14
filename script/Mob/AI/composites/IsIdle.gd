class_name IsIdle extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard):
	if actor.state.name == "Idle":
		return SUCCESS
	return FAILURE
