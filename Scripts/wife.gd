extends CharacterBody3D
#wife
#dialogue
@onready var interact_text = $InteractText

@onready var dialogue_status = false
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var collision = $Interactable/CollisionShape3D
@onready var front_marker = $FrontMarker3D


@onready var collision_state = true



const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	pass

func _on_interactable_focused(interactor):
	interact_text.visible = true
	collision.visible = true
	
	if player:
		player.disable_camera_movement = true
		
		
	pass # Replace with function body.


func _on_interactable_interacted(interactor):
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_1")
	interact_text.visible = false
	#collision.visible = false
	pass # Replace with function body.


func _on_interactable_unfocused(interactor):
	interact_text.visible = false
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "wife_2")
	if player:
		player.disable_camera_movement = false
		
	rotation = transform.basis.get_euler()
	pass # Replace with function body.

func action() -> void:
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pass


