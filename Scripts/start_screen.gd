extends Control
@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("camera")

#start
func _on_button_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass # Replace with function body.

#settibgs
func _on_button_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_screen.tscn")
	pass # Replace with function body.

#credits
func _on_button_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	pass # Replace with function body.

#quit
func _on_button_quit_pressed():
	queue_free()
	pass # Replace with function body.
