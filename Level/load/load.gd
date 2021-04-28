extends Node

onready var progress = $Panel/ProgressBar

var level

var thread = Thread.new()

func _ready():
	level = $"/root/global_level_manager".get_scene()
	
	load_scene(level)

func load_scene(path):
	
	thread.start( self, "_background_load",path, thread.PRIORITY_HIGH)

func _background_load(path):
	
	var loader = ResourceLoader.load_interactive(path)
	
	var ResourceData = null
	
	while true:
		
		var Stage = loader.poll()
		
		var ProgressValue = (float(loader.get_stage()) / float(loader.get_stage_count()))*100
		
		progress.call_deferred("set_value", ProgressValue)
		
		# is the loader done?
		if Stage == ERR_FILE_EOF:
			ResourceData = loader.get_resource()
			break
		
		#is there an error with loading then exit
		elif Stage != OK:
			print("loading Error")
			break
	
	call_deferred("_load_done",ResourceData)

func _load_done(ResourceData):
	
	thread.wait_to_finish()
	
	$Panel.raise()
	
	progress.value = 100
	
	var new_scene = ResourceData.instance()
	
	$data.add_child(new_scene)
	
	$AnimationPlayer.play("load level")
