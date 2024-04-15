extends Marker3D
@onready var interact_text = $InteractText

#player
@onready var player = get_tree().get_nodes_in_group("Player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	interact_text.visible = false
	pass # Replace with function body.


func _on_interactable_focused(interactor):
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	if player:
		teleport_player_to_marker()
	interact_text.visible = false
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.

func teleport_player_to_marker():
	var markers = get_tree().get_nodes_in_group("TeleportMarker")
	
	for marker in markers:
		if identify_correct_marker(marker):
			player.global_transform.origin = marker.global_transform.origin
			break
	pass

func identify_correct_marker(marker):
	return marker.name == "LadderPointBottom"
