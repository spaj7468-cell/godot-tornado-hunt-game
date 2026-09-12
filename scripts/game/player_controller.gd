extends CharacterBody3D

class_name PlayerController

# Движение
@export var speed: float = 20.0
@export var rotation_speed: float = 3.0
@export var acceleration: float = 10.0
@export var friction: float = 0.1

# Камера
@onready var camera: Camera3D = $Camera3D
@export var mouse_sensitivity: float = 0.003
var camera_rotation: Vector2 = Vector2.ZERO

# Атака
var crosshair_position: Vector2 = Vector2.ZERO
var is_attacking: bool = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	_handle_movement(delta)
	_handle_camera(delta)
	_handle_attack()
	move_and_slide()

func _handle_movement(delta):
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
	input_velocity = input_velocity.rotated(Vector3.UP, rotation.y)
	
	velocity.x = lerp(velocity.x, input_velocity.x, acceleration * delta)
	velocity.z = lerp(velocity.z, input_velocity.z, acceleration * delta)
	velocity.y -= 9.8 * delta

func _handle_camera(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _handle_attack():
	if Input.is_action_pressed("ui_select"):
		is_attacking = true
	else:
		is_attacking = false
