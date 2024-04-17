extends Control

@onready var texture_button = $ReturnMarginContainer/TextureButton


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
	pass # Replace with function body.
