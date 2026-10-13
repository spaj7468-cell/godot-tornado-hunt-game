extends Node3D

var info_popup: PopupPanel
var info_label: Label

func _ready() -> void:
	var radar_button := get_node_or_null("HUD/Control/RadarButton") as Button
	var map_button := get_node_or_null("HUD/Control/MapButton") as Button
	if radar_button:
		radar_button.pressed.connect(_show_radar_info)
	if map_button:
		map_button.pressed.connect(_show_map_info)
	_build_info_popup()

func _build_info_popup() -> void:
	info_popup = PopupPanel.new()
	info_popup.name = "InfoPopup"
	var content := VBoxContainer.new()
	content.custom_minimum_size = Vector2(300, 130)
	content.add_theme_constant_override("separation", 12)
	info_popup.add_child(content)
	info_label = Label.new()
	info_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	content.add_child(info_label)
	var close_button := Button.new()
	close_button.text = "CLOSE"
	close_button.pressed.connect(info_popup.hide)
	content.add_child(close_button)
	add_child(info_popup)

func _show_radar_info() -> void:
	_show_info("RADAR", "Radar UI is a prototype placeholder. Live storm detection is not implemented yet.")

func _show_map_info() -> void:
	var player := get_node_or_null("Player") as Node3D
	var position_text := "Player position unavailable"
	if player:
		position_text = "Player position: X %.1f, Y %.1f, Z %.1f" % [player.global_position.x, player.global_position.y, player.global_position.z]
	_show_info("MAP", position_text)

func _show_info(title: String, message: String) -> void:
	info_label.text = "%s\n\n%s" % [title, message]
	info_popup.popup_centered()
