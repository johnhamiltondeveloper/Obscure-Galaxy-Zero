extends Node

signal next

export(NodePath) var NextNode

export(NodePath) var EndPoint

func _ready():
	self.connect("next",get_node(NextNode),"start")
	
func start():
	pass

func done():
	self.emit_signal("next")


func _on_Tween_tween_all_completed():
	pass # Replace with function body.
