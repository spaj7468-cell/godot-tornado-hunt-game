extends Control

var settings_popup: PopupPanel
var volume_slider: HSlider
var fullscreen_toggle: CheckButton

func _ready() -> void:
	$VBoxContainer/PlayButton.pressed.connect(_on_play_pressed)
	$VBoxContainer/SettingsButton.pressed.connect(_on_settings_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)
	_build_settings_popup()

func _build_settings_popup() -> void:
	settings_popup = PopupPanel.new()
	settings_popup.name = "SettingsPopup"
	var content := VBoxContainer.new()
	content.custom_minimum_size = Vector2(340, 170)
	content.add_theme_constant_override("separation", 14)
	settings_popup.add_child(content)

	var heading := Label.new()
	heading.text = "SETTINGS"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	content.add_child(heading)

	var volume_label := Label.new()
	volume_label.text = "Master volume"
	content.add_child(volume_label)

	volume_slider = HSlider.new()
	volume_slider.min_value = 0
	volume_slider.max_value = 100
	volume_slider.step = 1
	volume_slider.value = 100
	volume_slider.value_changed.connect(_on_volume_changed)
	content.add_child(volume_slider)

	fullscreen_toggle = CheckButton.new()
	fullscreen_toggle.text = "Fullscreen"
	fullscreen_toggle.toggled.connect(_on_fullscreen_toggled)
	content.add_child(fullscreen_toggle)

	var close_button := Button.new()
	close_button.text = "DONE"
	close_button.pressed.connect(settings_popup.hide)
	content.add_child(close_button)
	add_child(settings_popup)

func _on_play_pressed() -> void:
	var result := get_tree().change_scene_to_file("res://game_world.tscn")
	if result != OK:
		push_error("Could not open res://game_world.tscn (error %s)." % result)

func _on_settings_pressed() -> void:
	settings_popup.popup_centered()

func _on_volume_changed(value: float) -> void:
	var master_bus := AudioServer.get_bus_index("Master")
	if master_bus >= 0:
		AudioServer.set_bus_volume_db(master_bus, linear_to_db(maxf(value / 100.0, 0.001)))

func _on_fullscreen_toggled(enabled: bool) -> void:
	if enabled:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_quit_pressed() -> void:
	get_tree().quit()
