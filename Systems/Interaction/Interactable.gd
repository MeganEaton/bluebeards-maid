extends Area3D

class_name Interactable

signal focused(interactor: Interactor)
signal unfocused(interactor: Interactor)
signal interacted(interactor: Interactor)

const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"


func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	
	
