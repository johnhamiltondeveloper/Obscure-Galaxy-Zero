extends Node

func _ready():
	pass

func _process(delta):
	pass

func startLevel():
	$Level_Data.Load()

func _on_new_pressed():
	startLevel()

func end_level():
	pass

func _on_player_Death():
	$Level_Data.clear()
	$UI/Level_failed.Load()

func _on_Waypoints_complete(time):
	$UI/Level_Complete.Load()
	$Level_Data.clear()

func _on_Main_startGame():
	$Level_Data.clear()
	startLevel()

func _on_Level_failed_main_menu():
	$Level_Data.clear()
	$UI/Main.Load()

func _on_Level_failed_restart_level():
	$Level_Data.clear()
	startLevel()
