extends Node

class_name GameManager

# Синглтон
static var instance: GameManager

# Переменные игры
var player_money: float = 0.0
var current_mode: String = "hunter"
var current_level: int = 1
var difficulty: float = 1.0

var modes = {
	"hunter": {"unlocked": true, "name": "Охотник"},
	"tornado": {"unlocked": false, "name": "Торнадо"},
	"clouds": {"unlocked": false, "name": "Облака"}
}

func _ready():
	if instance:
		queue_free()
	else:
		instance = self

func add_money(amount: float):
	player_money += amount
	print("Заработано: ", amount, "$ Всего: ", player_money, "$")

func unlock_mode(mode_name: String):
	if mode_name in modes:
		modes[mode_name]["unlocked"] = true

func change_mode(mode_name: String):
	if modes[mode_name]["unlocked"]:
		current_mode = mode_name
