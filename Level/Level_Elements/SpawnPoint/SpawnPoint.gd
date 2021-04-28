extends Spatial
class_name Spawn, "res://Level/Level_Elements/SpawnPoint/SpawnPoint.svg"

onready var player = preload("res://player/player.tscn")

export(NodePath) var NextNode

signal next

func _ready():
	self.connect("next",get_node(NextNode),"start")

func Spawn():
	
	var newPlayer = player.instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_child(newPlayer)

func Death():
	
	var waypoints = get_tree().get_nodes_in_group("waypoint_manager")
	
	print(waypoints)
	
	for i in waypoints:
		i.reset()
	
	self.emit_signal("next")

func start():
	Spawn()
