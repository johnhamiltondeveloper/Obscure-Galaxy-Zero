extends Node

signal Death

onready var player = preload("res://player/Spaceship.tscn")

func _ready():
	pass

func Spawn():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	var newPlayer = player.instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_child(newPlayer)

func Death():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	self.emit_signal("Death")

func clear():
	for i in get_children():
		i.queue_free()
