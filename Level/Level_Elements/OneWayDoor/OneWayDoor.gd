extends Spatial


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if $AnimationPlayer.current_animation != "player":
		if body.is_in_group("player"):
			$AnimationPlayer.play("Open")
