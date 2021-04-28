extends HBoxContainer

var button = preload("res://Level/levels/Main_menu/level_select_menu/Level_button.tscn")
var group = preload("res://Level/levels/Main_menu/level_button_group.tres")

func _ready():
	for i in global_level_manager.game_levels:
		var new_button = button.instance()
		new_button.level = i
		add_child(new_button)
	
	for i in get_children():
		i.group = group
