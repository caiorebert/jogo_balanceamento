extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("left"):
		velocity.x = -1 * SPEED
	elif Input.is_action_pressed("right"):
		velocity.x = 1 * SPEED		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#direction = Input.get_axis("ui_up", "ui_down")

	#if direction:
	#	velocity.y = direction * SPEED
	#else:
	#	velocity.y = move_toward(velocity.y, 0, SPEED)

	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk";
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk";		
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation = "stop";				
		$AnimatedSprite2D.stop()				
	
	move_and_slide()
