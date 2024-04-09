extends CharacterBody3D


@onready var animation_tree = $Player/AnimationTree


@onready var model_displacer = $Player/ModelDisplacer

@onready var camera_pivot = $Player/CameraOrigin/SpringArm3D
@export var sensitivity = 1000

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / sensitivity
		camera_pivot.rotation.z -= event.relative.y / sensitivity
		camera_pivot.rotation.z = clamp(camera_pivot.rotation.z, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.z = direction.x * SPEED
		velocity.x = -direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if velocity.x != 0 or velocity.z != 0:
		model_displacer.look_at(transform.origin + velocity)

	move_and_slide()

