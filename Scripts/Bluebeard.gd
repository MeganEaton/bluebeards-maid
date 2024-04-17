extends CharacterBody3D

@onready var animation_player = $AnimationPlayer

@onready var marker = $Spawn/Marker


@onready var player = get_tree().get_nodes_in_group("Player")[0]

func _ready():
	animation_player.play("bluebeard_sleep")

func _on_interactable_focused(interactor):
	if player:
		teleport_to_marker()
		player.can_move = false
		print("focused")
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	if player:
		player.can_move = true
	pass # Replace with function body.

func teleport_to_marker():
	print("teleport function")
	player.global_transform.origin= marker.global_transform.origin
	pass
	
