extends Button

var level = "1"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = global_level_manager.get_level_name(level)
	self.rect_min_size[0] = get_parent().rect_size[1]

func _pressed():
	global_level_manager.set_next_level(level)
