extends Node3D
@onready var interact_text = $InteractText
@onready var collision = $Interactable/CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_interactable_focused(interactor):
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	var player = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.play_interaction_animation("water_plant")
	interact_text.visible = false
	collision.queue_free()
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.
