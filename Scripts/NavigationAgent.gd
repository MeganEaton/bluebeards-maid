extends NavigationAgent3D

@export var patrol_points := []
@export var patrol_speed := 2.0
@export var chase_speed := 4.0

var current_target_point_index := 0
var is_chasing := false
var player_node : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
