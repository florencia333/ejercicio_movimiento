extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1050.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	var double_jumps_available = 1
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or double_jumps_available > 0:
			if not is_on_floor():
				double_jumps_available -= 1
			velocity.y = JUMP_VELOCITY
		
	if is_on_floor():
		double_jumps_available = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
		
	
	
	move_and_slide()
