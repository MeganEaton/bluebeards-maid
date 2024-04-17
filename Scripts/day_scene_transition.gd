extends MeshInstance3D

@onready var interact_text = $InteractText

@onready var animation_player = $AnimationPlayer

@onready var night_scene_resource = ResourceLoader.load("res://Scenes/night_scene.tscn")

signal transitioned

func _ready():
	pass 


func _on_interactable_focused(interactor):
	interact_text.visible = true
	
	pass 


func _on_interactable_interacted(interactor):
	interact_text.visible = false
	animation_player.play("to_night")
	pass 


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "to_night":
		emit_signal("transitioned")
		animation_player.play("fade_normal")
		get_tree().change_scene_to_packed(night_scene_resource)
	pass 
