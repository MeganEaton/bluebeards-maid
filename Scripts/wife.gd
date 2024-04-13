extends CharacterBody3D

#dialogue
@onready var interact_text = $InteractText
@onready var dialogue_status = false
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var collision = $Interactable/CollisionShape3D

@onready var interactable = $Interactable

#collision.visible = true
@onready var collision_state = true

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _on_interactable_focused(interactor):
	interact_text.visible = true
	collision.visible = true
	#collision.disabled = false
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_1")
	interact_text.visible = false
	collision.visible = false
	#collision.disabled = true
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_2")
	pass # Replace with function body.

func action() -> void:
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pass


