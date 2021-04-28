extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("exit"):
		if(get_tree().paused == false):
			get_tree().paused = true
			self.visible = true
		else:
			get_tree().paused = false
			self.visible = false


func _on_Exit_pressed():
	get_tree().paused = false
	self.visible = false
	get_tree().quit()


func _on_continue_pressed():
	self.visible = false
	get_tree().paused = false

func _on_Exit2_pressed():
	get_tree().paused = false
	self.visible = false
	global_level_manager.change_level("menu")
