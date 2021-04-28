extends Node

signal next_level
signal main_menu

func _ready():
	self.visible = false

func Load():
	self.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func Unload():
	self.visible = false

func _on_Next_pressed():
	self.emit_signal("next_level")
	self.Unload()


func _on_main_pressed():
	self.Unload()
	self.emit_signal("main_menu")
