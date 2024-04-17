extends Node3D
@onready var player = $"../PlayerCharacterBody3D"

@onready var animation_player = $"../AnimationPlayer"

func _on_interactable_focused(interactor):
	animation_player.play("game_end_anim")
	player.visible = false
	pass # Replace with function body.


func _on_quit_texture_button_pressed():
	queue_free()
	pass # Replace with function body.


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
	pass # Replace with function body.
