extends Node3D
var file1 = "user://file1.dat"
var fileloaded=false
var contactcount=0
signal dialogue
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position=global.location
	if global.indexdisabled==false:
		$CanvasLayer/Index.disabled=false
	else:
		$CanvasLayer/Index.disabled=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.laytoncontact ==true and global.hitting==true:
		laytondialogue()
		global.indexdisabled=false
		$CanvasLayer/Index.disabled=false
		$SpringArm3D.position=global.location
	global.location=$Player.position



func _on_static_body_3d_2_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	$Player.position=$Spawnpoint.position # Replace with function body.
	$SpringArm3D.position=$Spawnpoint.position # Replace with function body.


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	contactcount+=1
	if contactcount > 1:
		global.laytoncontact=true # Replace with function body.
func laytondialogue():
	global.hitting =false
	dialogue.emit()
	

func _on_area_3d_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	global.laytoncontact=false # Replace with function body.
func loadfile1():
	if fileloaded==false:
		if FileAccess.file_exists(file1):
			var file = FileAccess.open(file1, FileAccess.READ)
			var filedata = file.get_var()
			puzzle.puzzles = filedata['puzzledata']
			global.location = filedata['location']
			$Player.position=global.location
			$SpringArm3D.position=global.location
			global.indexdisabled = filedata['indexdisabled']
			global.hintcoins = filedata['hintcoins']
			global.totalscore = filedata['totalscore']
			file.close()
		else:
			pass
	else:
		pass
func savegame():
	var file = FileAccess.open(file1, FileAccess.WRITE)
	var filedata= {
		'puzzledata':puzzle.puzzles,
		'location':global.location,
		'indexdisabled':global.indexdisabled,
		'hintcoins':global.hintcoins,
		'totalscore':global.totalscore
	}
	file.store_var(filedata)
	file.close()


func _on_save_pressed() -> void:
	savegame() # Replace with function body.


func _on_load_pressed() -> void:
	loadfile1() # Replace with function body.
	fileloaded = true


func _on_index_pressed() -> void:
	get_tree().change_scene_to_file("res://puzzle_index.tscn") # Replace with function body.
