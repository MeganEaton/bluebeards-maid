extends Node3D

@onready var canvas_layer = $"Settings Screen/AspectRatioContainer/CanvasLayer"
@onready var settings_screen = $"Settings Screen"
@onready var aspect_ratio = $"Settings Screen/AspectRatioContainer"

func _ready() -> void:
	canvas_layer.visible = false


func _on_texture_button_pressed():
	var is_visible = canvas_layer.visible
	canvas_layer.visible = !is_visible
	settings_screen.visible = !is_visible
	aspect_ratio.visible = !is_visible
	pass # Replace with function body.


func _on_quit_texture_button_pressed():
	queue_free()
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause_menu()

func toggle_pause_menu():
	var is_visible = canvas_layer.visible
	canvas_layer.visible = !is_visible
	settings_screen.visible = !is_visible
	aspect_ratio.visible = !is_visible
