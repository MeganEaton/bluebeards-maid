extends Area3D



@onready var interact_text = $InteractText


func _on_interactable_interacted(interactor):
	pass # Replace with function body.


func _on_interactable_focused(interactor):
	var game_controller = get_tree().get_first_node_in_group("GameController")
	game_controller.pick_key()
	
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):

	pass # Replace with function body.

