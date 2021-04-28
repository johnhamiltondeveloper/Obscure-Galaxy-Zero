extends Node
class_name scoreboard, "res://Level/Level_Elements/Scoreboard/Scoreboard.svg"

signal next

var startTime

export(NodePath) var NextNode

func _ready():
	self.connect("next",get_node(NextNode),"start")
	
func start():
	self.emit_signal("next")
	startTime = OS.get_unix_time()

func get_elapsed_time():
	return (OS.get_unix_time() - startTime) % 60
