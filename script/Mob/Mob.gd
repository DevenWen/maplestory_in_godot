class_name Mob
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Mob 参数
@export var img = "1210100"

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

# API
func set_flip(flip: bool):
	if flip:
		$Marker2D.scale.x = -1
	else:
		$Marker2D.scale.x = 1

func play(animation):
	# TODO 实现 animation player
	$Animation.play(animation)
