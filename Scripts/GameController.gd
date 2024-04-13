extends CanvasLayer

@onready var key_panel = $MarginContainer/KeyPanel
@onready var quest_alert = $QuestAlert
@onready var display_timer = $Timer
@onready var key_count = $MarginContainer/KeyPanel/KeyCount
@onready var key_display = $MarginContainer
@onready var animation_player = $AnimationPlayer


var current_key_count: int = 0
var total_key_count: int = 0


func _ready():
	total_key_count = get_tree().get_nodes_in_group("Key").size()
	key_count.text = "0/" + str(total_key_count)
	key_panel.visible = false
	pass
	
func pick_key():
	current_key_count = current_key_count +1
	key_count.text = str(current_key_count) + "/" + str(total_key_count)
	if current_key_count>=total_key_count:
		quest_alert.visible = true
		key_count.visible = true
	animation_player.play("key_panel_display")


func get_current_key_count() -> int:
	return current_key_count

func get_total_key_count() -> int:
	return total_key_count

#func _on_timer_timeout():
	#toggle_key_visibility()
	#pass # Replace with function body.

#func toggle_key_visibility():
	#if key_panel.visible:
		#key_panel.hide()
	#else:
		#key_panel.show()
