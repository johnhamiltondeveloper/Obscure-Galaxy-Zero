extends Control

export(NodePath) var NextNode

signal next

func _ready():
	if NextNode != null:
		self.connect("next",get_node(NextNode),"start")
	
func start(time):
	$AnimationPlayer.play("end")
	$score_text.text = str(time)


func _on_menu_pressed():
	global_level_manager.change_level("menu")
