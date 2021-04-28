extends ItemList

func _ready():
	
	for i in global_level_manager.game_levels:
		
		add_item(global_level_manager.names[i])

func start_level():
	if self.is_anything_selected() == true:
		var ItemIndex = get_selected_items()[0]
		
		var levelID = global_level_manager.game_levels[ItemIndex]
		
		global_level_manager.change_level(levelID)

func _on_Button_pressed():
	start_level()
