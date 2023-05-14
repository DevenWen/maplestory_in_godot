class_name Mob
extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Mob 参数
@export var img = "1210100"
@export var move_speed: float = 100.0
@export var jump_velocity: float = 400

# API
func set_flip(flip: bool):
	if flip:
		$Animation/Marker2D.scale.x = -1
	else:
		$Animation/Marker2D.scale.x = 1

func play(animation):
	# TODO 实现 animation player
	$Animation.play(animation)


