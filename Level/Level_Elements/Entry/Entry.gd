extends Node

class_name entry, "res://Level/Level_Elements/Entry/entry.svg"

signal next
signal spawn

export(NodePath) var NextNode
export(NodePath) var SpawnNode

func _ready():
	self.connect("next",get_node(NextNode),"start")
	self.connect("spawn",get_node(SpawnNode),"start")
	$Timer.start(0.1)

func start():
	$Timer.start(0.1)

func _on_Timer_timeout():
	self.emit_signal("next")
	self.emit_signal("spawn")
