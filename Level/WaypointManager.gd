extends Node

signal complete(time)
onready var waypoint = preload("res://Level/Level_Elements/Waypoint/waypoint.tscn")

var running = false
var time = 0

var waypoints

func _ready():
	pass

func _process(delta):
	if running == true:
		if self.get_child_count() == 0:
			end()
		
		time += 1*delta

func start():
	if running == false:
		running = true
		
func end():
	running = false
	
	if get_parent().isPlaying == true:
		emit_signal("complete",time)

func Get_Data():
	pass

func set_Data(data):
	var pos = []
	for i in data:
		var temp = Vector3.ZERO
		temp[0] = i[0]
		temp[2] = i[1]
		pos.append(temp)
	
	Create(pos)

func Create(Positions):
	
	for i in Positions:
		var newWaypoint = waypoint.instance()
		newWaypoint.global_transform.origin = i
		add_child(newWaypoint)

func clear():
	for i in get_children():
		i.queue_free()
