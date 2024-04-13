extends Node3D

@onready var lamp = $Lamp_v2
@onready var interact_text = $InteractText
@onready var lamp_light = $Lamp_v2/LampLight
@onready var pickup_label = $InteractText/Panel/Label
@onready var place_label = $InteractText/Panel/Label2


var light_is_held: bool = false

func _ready():
	interact_text.visible = false
	pickup_label.visible = false
	place_label.visible = false
	
	
func _on_interactable_focused(interactor):
	interact_text.visible = true
	if light_is_held:
		pickup_label.visible = false
		place_label.visible = true
	else:
		pickup_label.visible = true
		place_label.visible = false
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	light_is_held = !light_is_held
	_update_visibility()
	if light_is_held:
		interact_text.visible = false
		lamp.visible = false
	else:
		lamp.visible = true
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	pass # Replace with function body.

func _update_visibility():
	pickup_label.visible = !light_is_held
	place_label.visible = light_is_held
	lamp.visible = light_is_held
	interact_text.visible = false
	var player = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.get_node("Player/ModelDisplacer/Player/Body/right_arm_002/Lamp_v2").visible = light_is_held
