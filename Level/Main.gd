extends Node2D

signal startGame

func _ready():
	self.visible = true

func Load():
	self.visible = true

func unload():
	self.visible = false

func _on_Button_pressed():
	unload()
	self.emit_signal("startGame")
