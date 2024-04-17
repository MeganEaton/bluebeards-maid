extends Node3D

@onready var game_controller: Node = get_node("/root/GameController")

@onready var interact_text = $InteractText
@onready var animation_player = $AnimationPlayer

var current_key_count = 0
var total_key_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	total_key_count = get_tree().get_nodes_in_group("Key").size()
	interact_text.visible = false
	pass 


func _on_interactable_focused(interactor):
	if game_controller.get_current_key_count() >= 13:
		interact_text.visible = true
	else:
		interact_text.visible = false
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	if game_controller.get_current_key_count() >= game_controller.get_total_key_count():
		animation_player.play("open_doors")
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.
