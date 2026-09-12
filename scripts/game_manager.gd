extends Node

class_name GameManager

static var instance: GameManager

var player_money: float = 0.0
var current_mode: String = "hunter"
var current_level: int = 1
var difficulty: float = 1.0

var modes = {
	"hunter": {"unlocked": true, "name": "Hunter"},
	"tornado": {"unlocked": false, "name": "Tornado"},
	"clouds": {"unlocked": false, "name": "Clouds"}
}

func _ready():
	if instance:
		queue_free()
	else:
		instance = self
		set_multiplayer_authority(1)

func add_money(amount: float):
	player_money += amount
	print("Earned: ", amount, "$ Total: ", player_money, "$")

func unlock_mode(mode_name: String):
	if mode_name in modes:
		modes[mode_name]["unlocked"] = true

func change_mode(mode_name: String):
	if modes[mode_name]["unlocked"]:
		current_mode = mode_name
