extends Node3D

@onready var window_r: Node = $"Window_v3-rigid"
@onready var window_l: Node = $"Window_v3-rigid_003"
@onready var interact_text: Control = $InteractText
@onready var label = $InteractText/Panel/Label
@onready var label_2 = $InteractText/Panel/Label2

var is_open: bool = false

func _ready():
	interact_text.visible = false

func animate_window(window_node: Node, target_angle_y: float) -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(window_node, "rotation_degrees:y", target_angle_y, 0.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)

func open_windows() -> void:
	is_open = true
	animate_window(window_r, -160)
	animate_window(window_l, 160)

func close_windows() -> void:
	is_open = false
	animate_window(window_r, -45)
	animate_window(window_l, 45)

func _on_interactable_interacted(interactor):
	if is_open:
		close_windows()
	else:
		open_windows()

func _on_interactable_focused(interactor):
	interact_text.visible = true
	if is_open:
		label.visible = false
		label_2.visible = true
	else:
		label.visible = true
		label_2.visible = false

func _on_interactable_unfocused(interactor):
	interact_text.visible = false

