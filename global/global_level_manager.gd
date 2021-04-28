extends Node

var next_level

var level = {
	"menu" : "res://Level/levels/Main_menu/menu.tscn",
	"1" : "res://Level/levels/level_test/Level.tscn"
}

var names = {
	"1" : "Test Level 1",
	"menu" : "Main Menu"
}

var game_levels = ["1"]

func _ready():
	pass # Replace with function body.

var newScene = null

func change_level(scene):
	if level.has(scene):
		newScene = level[scene]
		get_tree().change_scene("res://Level/load/load.tscn")

func get_scene():
	return newScene

func set_next_level(level):
	next_level = level

func get_level_name(name):
	if names.has(name):
		return names[name]
	else:
		return "NULL"
