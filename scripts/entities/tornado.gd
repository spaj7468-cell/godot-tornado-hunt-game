extends Node3D

class_name Tornado

@export var speed: float = 15.0
@export var damage: float = 10.0
var category: int = 0  # EF0-EF5
var health: float = 100.0
var direction: Vector3 = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()

func _ready():
	health = 100.0 + (category * 30)
	damage = 10.0 + (category * 5)
	_update_appearance()

func _process(delta):
	position += direction * speed * delta

func _update_appearance():
	# Масштаб зависит от категории
	var scale_factor = 1.0 + (category * 0.5)
	scale = Vector3(scale_factor, scale_factor, scale_factor)

func take_damage(amount: float):
	health -= amount
	if health <= 0:
		destroy()

func destroy():
	queue_free()
	GameManager.instance.add_money(100.0 * (category + 1))
