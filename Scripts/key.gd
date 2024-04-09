extends Area3D

@onready var key_outline = $Key_001/KeyOutline
@onready var interact_text = $InteractText


func _on_interactable_interacted(interactor):
	var game_controller = get_tree().get_first_node_in_group("GameController")
	game_controller.pick_key()
	queue_free()
pass # Replace with function body.


func _on_interactable_focused(interactor):
	key_outline.visible = true
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	key_outline.visible = false
	interact_text.visible = false
	pass # Replace with function body.
