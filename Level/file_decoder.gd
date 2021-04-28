extends Node

var data
var waypoints
var objects

func _ready():
	pass # Replace with function body.

func load_data():
	data = fake_data()
	
	waypoints = data["waypoints"]
	objects = data["objects"]

func get_waypoints():
	return waypoints

func get_objects():
	return objects

func fake_data():
	var new_data = {
		"waypoints" : [[20,-20],[-30,20],[20,20],[-20,-20]], # Array of locations
		"objects" : # ID, Location, Rotation, Size
		[
		[1,[20,0,0],[0,0,0],3.5],
		[1,[-40,0,0],[0,0,0],2],
		[1,[-10,0,10],[0,0,0],4]
		] 
	}
	
	return new_data
