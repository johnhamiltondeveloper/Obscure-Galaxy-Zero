extends Node

var motion = Vector2.ZERO

var isMouse = true

func _ready():
	pass
	
func input():
	
	var ThrusterRight = int(Input.is_action_pressed("Action_thruster_right"))
	var ThrusterLeft = int(Input.is_action_pressed("Action_thruster_left"))
	var SideThrusters = ThrusterRight - ThrusterLeft
	var MainThruster = int(Input.is_action_pressed("Action_thruster_Back"))
	
	return Vector2(SideThrusters,-MainThruster)

var TargetPos = Vector2.ZERO

func MotionTagget(delta):

	var MousePos = Vector2.ZERO
	
	if isMouse == true:
		TargetPos = get_viewport().get_mouse_position()
	else:
		if Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1)).length() > 0.5:
			TargetPos += Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1))*get_viewport().size.length()/(10000*delta)
	
	
	TargetPos = Vector2(clamp(TargetPos[0],0,get_viewport().size[0]),clamp(TargetPos[1],0,get_viewport().size[1]))
	$Tagget.position = TargetPos
	
	return TargetPos

func _input(event):
	
	if event is InputEventMouseMotion:
		if isMouse != true:
			isMouse = true
			get_viewport().warp_mouse(TargetPos)
		
	if event is InputEventJoypadMotion:
		if isMouse != false:
			isMouse = false
