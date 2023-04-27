extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		print("Jump!")
		$Player.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = null
	if Input.is_action_pressed("Left") and is_on_floor():
		print("Left")
		$Player.play("walk1", 0.8)
		$Player.set_flip(false)
		direction = -1
	elif Input.is_action_pressed("Right") and is_on_floor():
		print("Right")
		$Player.play("walk1", 0.8)
		$Player.set_flip(true)
		direction = 1
	elif is_on_floor():
		$Player.play("stand1")
		
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
