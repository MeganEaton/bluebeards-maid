extends CharacterBody3D

@onready var animation_tree = $Player/AnimationTree
@onready var anim_state = $Player/AnimationTree.get("parameters/playback")
@onready var animation_player = $Player/PlayerAnimationPlayer
@onready var hand_lamp = $Player/ModelDisplacer/Player/Body/right_arm_002/Lamp_v2


@onready var player = $Player

@onready var model_displacer = $Player/ModelDisplacer

@onready var camera_pivot = $Player/CameraOrigin/SpringArm3D
@export var sensitivity = 1000

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var disable_camera_movement = false


func _input(event):
	if event is InputEventMouseMotion:
		if !disable_camera_movement:
			rotation.y -= event.relative.x / sensitivity
			camera_pivot.rotation.z -= event.relative.y / sensitivity
			camera_pivot.rotation.z = clamp(camera_pivot.rotation.z, deg_to_rad(-90), deg_to_rad(90))



func _physics_process(delta):
	# Add the gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var vl = velocity * player.transform.basis
	animation_tree.set("parameters/Idle_Run/blend_position", Vector2(vl.x, -vl.z) / SPEED)
	
	if Input.is_action_pressed("ui_left"):
		anim_state.travel("player_run")
	else:
		anim_state.travel("Idle_Run")
	
	if direction:
		velocity.z = direction.x * SPEED
		velocity.x = -direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if velocity.x != 0 or velocity.z != 0:
		model_displacer.look_at(transform.origin + velocity)
		

	move_and_slide()
	
func play_interaction_animation(water_plant: String):
	animation_player.play("water_plant")

func play_ladder_animation(climb_ladder: String):
	animation_player.play("climb_ladder")

func play_ladder_animation_backwards(climb_ladder: String):
	animation_player.play_backwards("climb_ladder")

func toggle_light_visibility():
	#inverts light visibility
	hand_lamp.visible = !hand_lamp.visible
	pass
