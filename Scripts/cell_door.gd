extends Node3D
@onready var cell_door = $cell_door
@onready var interact_text = $InteractText
@onready var animation_player = $AnimationPlayer

var is_open: bool = false



func _on_interactable_interacted(interactor):
	if is_open:
		pass
	else:
		animation_player.play("open_cell")
		interact_text.queue_free()


func _on_interactable_focused(interactor):
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	pass # Replace with function body.
