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
		is_open = true


func _on_interactable_focused(interactor):
	if is_open:
		interact_text.visible = false
	else:
		interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.


func _on_animation_player_animation_finished(open_cell):
	animation_player.queue_free()
	pass # Replace with function body.
