class_name StateMachine
extends Node

signal transitioned(state_name)

@export var inital_state := NodePath()
@onready var state: State = get_node(inital_state)

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.state_machine = self
	state.enter()

func _unhandled_input(event: InputEvent):
	state.handle_input(event)

func _process(delta):
	state.update(delta)
	
func _physics_process(delta):
	state.physics_update(delta)
	

# This function calls the current state's exit() function, then changes the active state,
# and calls its enter function.
# It optionally takes a `msg` dictionary to pass to the next state's enter() function.
func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	# Safety check, you could use an assert() here to report an error if the state name is incorrect.
	# We don't use an assert here to help with code reuse. If you reuse a state in different state machines
	# but you don't want them all, they won't be able to transition to states that aren't in the scene tree.
	print("transition: ", state, " -> ", target_state_name)
	if not has_node(target_state_name):
		printerr("no state found: ", target_state_name)
		return

	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)
	
