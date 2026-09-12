extends Node3D

class_name WeatherSystem

enum TornadoCategory { EF0, EF1, EF2, EF3, EF4, EF5 }

var current_weather: String = "clear"
var current_wind_speed: float = 0.0
var tornado_spawn_timer: float = 0.0
var tornado_spawn_interval: float = 20.0
var active_tornadoes: int = 0

var weather_patterns = {
	"clear": {"wind": 5.0, "chance": 0.1},
	"cloudy": {"wind": 10.0, "chance": 0.3},
	"storm": {"wind": 20.0, "chance": 0.6},
	"tornado": {"wind": 50.0, "chance": 1.0}
}

func _ready():
	set_weather("clear")

func _process(delta):
	tornado_spawn_timer += delta
	
	if tornado_spawn_timer >= tornado_spawn_interval:
		if randf() < weather_patterns[current_weather]["chance"]:
			spawn_tornado()
		tornado_spawn_timer = 0.0

func set_weather(weather_type: String):
	if weather_type in weather_patterns:
		current_weather = weather_type
		current_wind_speed = weather_patterns[weather_type]["wind"]
		print("Weather changed to: ", weather_type)

func spawn_tornado():
	var tornado_scene = preload("res://scenes/game/tornado.tscn")
	if tornado_scene:
		var tornado = tornado_scene.instantiate()
		tornado.position = Vector3(randf_range(-100, 100), 0, randf_range(-100, 100))
		tornado.category = randi_range(0, 5)
		add_child(tornado)
		active_tornadoes += 1
		print("Tornado spawned! Category: EF", tornado.category)

func get_wind_speed() -> float:
	return current_wind_speed

func decrease_tornado_count():
	if active_tornadoes > 0:
		active_tornadoes -= 1
