extends CharacterBody3D

@onready var interact_text = $InteractText
@onready var dialogue_status = false

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _on_interactable_focused(interactor):
	interact_text.visible = true
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	if Input.is_action_just_pressed("ui_accept") and dialogue_status:
		dialogue_status = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_1")
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_2")
	pass # Replace with function body.

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)


