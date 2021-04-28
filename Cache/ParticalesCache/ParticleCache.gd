extends Spatial

var waypoints = preload("res://Level/Level_Elements/Waypoint/waypoint_particles.tres")

func _ready():
	var particles_instance = Particles.new()
	particles_instance.set_process_material(waypoints)
	particles_instance.set_one_shot(true)
	particles_instance.set_emitting(true)
	self.add_child(particles_instance)
