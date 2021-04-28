extends Node

var currentLevel = 0

func _ready():
	pass # Replace with function body.

func _on_Level_Complete_main_menu():
	$Level_Manager/UI/Main.Load()

func _on_Level_Complete_next_level():
	$Level_Manager.startLevel()

func get_level():
	pass

func get_next_level():
	pass
