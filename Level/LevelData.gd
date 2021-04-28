extends Node

signal fail
signal win
signal end

var isPlaying = false

func _ready():
	pass

func Load():
	$file_decoder.load_data()
	
	$Objects.set_Data($file_decoder.get_objects())
	$Waypoints.set_Data($file_decoder.get_waypoints())
	$player.Spawn()
	
	isPlaying = true

func clear():
	$Objects.clear()
	$Waypoints.clear()
	$player.clear()
	
	isPlaying = false
