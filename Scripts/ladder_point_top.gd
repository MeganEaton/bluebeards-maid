extends Marker3D
@onready var interact_text = $InteractText

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_interactable_focused(interactor):
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	var player = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.play_ladder_animation_backwards("climb_ladder")
	interact_text.visible = false
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.
