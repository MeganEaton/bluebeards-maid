extends Control

@onready var animation_player = $AspectRatioContainer/CanvasLayer/AnimationPlayer

func _ready():
	animation_player.play("camera")

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
	pass # Replace with function body.


func _on_quit_texture_button_pressed():
	queue_free()
	pass # Replace with function body.
