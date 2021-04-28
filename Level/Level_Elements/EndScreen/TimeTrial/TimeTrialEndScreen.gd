extends Node

class_name TimeTrial, "res://Level/Level_Elements/EndScreen/endscreen.svg"

signal start(time)

export(NodePath) var NextNode
export(NodePath) var Scoreboard

signal next

func _ready():
	self.connect("start",get_node(NextNode),"start")

func start():
	var node = get_node(Scoreboard)
	self.emit_signal("start",node.get_elapsed_time())
