extends Node2D

signal restart_level
signal main_menu

func _ready():
	pass # Replace with function body.

func Load():
	self.visible = true

func unload():
	self.visible = false

func _on_Home_pressed():
	emit_signal("main_menu")
	unload()

func _on_Retry_pressed():
	emit_signal("restart_level")
	unload()
