extends CharacterBody2D

const attack_scene := preload("res://attack.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	#$AnimatedSprite2D.animation = "stop";
	#$AnimatedSprite2D.play();
	
	if Input.is_action_just_released("attack"):
		
		$AnimatedSprite2D.play("attack");
		
		var attack = attack_scene.instantiate()

		if (sign($attack_point.position.x)==1):
			attack.get_child(1)
			attack.set_direction(1);
		else:
			attack.set_direction(-1);

		attack.global_position = $attack_point.global_position
		
		get_parent().add_child(attack)
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("left"):
		velocity.x = -1 * SPEED
		if (sign($attack_point.position.x)==1):
			$attack_point.position.x *= -1
	elif Input.is_action_pressed("right"):
		velocity.x = 1 * SPEED		
		if (sign($attack_point.position.x)==-1):
			$attack_point.position.x *= -1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk";
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk";		
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()		
	
	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if ($AnimatedSprite2D.animation=="attack"):
		$AnimatedSprite2D.animation = "stop";
		$AnimatedSprite2D.play();
