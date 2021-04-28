extends KinematicBody

signal Death

var cameraHeight = 40

var stuntMode = true

var Multiplier = 0

var BounceTime = 0.09

var Speed = 30

var stopSpeed = 0.07


onready var CameraCurrent = get_viewport().get_camera()

var CameraPlace = Vector3.ZERO

func _ready():
	CameraPlace = self.global_transform.origin + Vector3(0,cameraHeight,0)
	
	get_viewport().warp_mouse(CameraCurrent.unproject_position(self.global_transform.origin))
	
	self.connect("Death",get_parent(),"Death")

var direction = Vector3(0,0,0)
var bounceDirection = Vector3(0,0,0)

func _process(delta):

	var tagget = $input.MotionTagget(delta)
	var input = $input.input()
	
	$NoMove/RayCast.global_transform.origin = CameraCurrent.project_position(tagget,0.0)
	$NoMove/RayCast.cast_to = CameraCurrent.project_ray_normal(tagget)*300
	
	if $NoMove/RayCast.is_colliding():
		self.look_at($NoMove/RayCast.get_collision_point(),Vector3(0,1,0))
	
	var SideThrusters = self.transform.basis[0]*input[0]
	var MainThruster = self.transform.basis[2]*input[1]
	
	direction = direction.linear_interpolate( (SideThrusters + MainThruster)*Speed,stopSpeed)
	
	direction = direction + (bounceDirection * ($HitCoolDown.time_left/BounceTime))
	
	move_and_slide((direction*110)*delta)
	
	self.global_transform.origin[1] = 0

	get_node("Particles").process_material.gravity = direction

func _on_CollisionDetection_Death():
	bounceDirection = direction.reflect(Vector3(0,1,0))
	$HitCoolDown.start(BounceTime)
