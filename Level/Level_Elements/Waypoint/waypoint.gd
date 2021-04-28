extends Area

class_name waypoint, "res://Level/Level_Elements/Waypoint/waypoint.svg"

var active = false

signal captured

func _ready():
	
	
	get_parent().connect("reset", self, "_reset")
	self.connect("captured",get_parent(),"_captured")
	get_parent().register()
	self.hide()

func _on_waypoint_body_entered(body):
	if body.is_in_group("player") and active == true:
		active = false
		self.emit_signal("captured")
		$AnimationPlayer.stop()
		$AnimationPlayer.play("death")
		$Particles.emitting = true
		$AudioStreamPlayer2D.play()
		
		#self.hide()

func set_deactive():
	active = false
	self.hide()

func set_active():
	$Timer.start(randf()*1)

func _on_Timer_timeout():
	self.show()
	active = true
	$AnimationPlayer.play("spawn")
