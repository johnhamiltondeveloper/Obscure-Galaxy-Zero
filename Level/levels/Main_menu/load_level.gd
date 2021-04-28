extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	global_level_manager.set_next_level(null)

func _pressed():
	global_level_manager.change_level(global_level_manager.next_level)
