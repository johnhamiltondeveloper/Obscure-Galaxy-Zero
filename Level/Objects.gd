extends Node

onready var object = preload("res://Bus.tscn")

var LevelTileSet

func _ready():
	pass # Replace with function body.

func set_Data(data):
	
	for i in data:
		
		var id = i[0] #gets the id of the object
		var pos = i[1] #gets an array of posistions of an object
		var rot = i[2] # gets the rotation of an object
		var size = i[3] # gets the size of an object
		
		var newObject = object.instance()
		newObject.global_transform.origin = Vector3(pos[0],0,pos[2])
		newObject.rotation = Vector3(rot[0],rot[1],rot[2])
		newObject.scale_object_local(Vector3(size,size,size))
		add_child(newObject)

func clear():
	for i in self.get_children():
		i.queue_free()
