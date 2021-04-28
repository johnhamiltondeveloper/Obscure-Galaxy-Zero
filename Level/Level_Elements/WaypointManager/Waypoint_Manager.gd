extends Node

class_name waypoint_Manager, "res://Level/Level_Elements/WaypointManager/waypoint_manager.svg"

export(NodePath) var NextNode

signal reset
signal next

var Max_waypoints = 0
var CurrentWaypointsPoints = 0

func _ready():
	self.connect("next",get_node(NextNode),"start")
	self.add_to_group("waypoint_manager")
	
func start():
	
	CurrentWaypointsPoints = Max_waypoints
	
	for i in get_children():
		i.set_active()

func register():
	Max_waypoints += 1
	CurrentWaypointsPoints = Max_waypoints

func _captured():
	CurrentWaypointsPoints -= 1
	
	if CurrentWaypointsPoints < 1:
		finished()

func finished():
	if NextNode != "":
		self.emit_signal("next")

func reset():
	for i in get_children():
		i.set_deactive()

func _process(delta):
	if self.get_child_count() == 0:
		print("win")
