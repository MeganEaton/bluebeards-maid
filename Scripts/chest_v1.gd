extends MeshInstance3D

@onready var animation_player = $AnimationPlayer
@onready var outline = $Outline



func _on_interactable_focused(interactor):
	animation_player.play("open_chest")
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	outline.visible = false
	pass # Replace with function body.
