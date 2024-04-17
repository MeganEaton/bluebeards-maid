extends CharacterBody3D

@onready var dialogue_status = false
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@onready var interact_text = $InteractText

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	pass

func _on_interactable_focused(interactor):
	interact_text.visible = true
	
	if player:
		player.disable_camera_movement = true
		
		
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "maid_1")
	interact_text.visible = false
	#collision.visible = false
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_2")
	if player:
		player.disable_camera_movement = false
		
	#rotation = transform.basis.get_euler()
	pass # Replace with function body.

func action() -> void:
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pass
