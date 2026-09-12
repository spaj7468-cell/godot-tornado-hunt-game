extends CharacterBody3D

@export var speed: float = 20.0
@export var acceleration: float = 10.0

func _physics_process(delta):
	var input_velocity = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		input_velocity.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_velocity.z += 1
	if Input.is_action_pressed("ui_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_velocity.x += 1
	
	input_velocity = input_velocity.normalized() * speed
	velocity.x = lerp(velocity.x, input_velocity.x, acceleration * 0.016)
	velocity.z = lerp(velocity.z, input_velocity.z, acceleration * 0.016)
	velocity.y -= 9.8 * delta
	
	move_and_slide()
