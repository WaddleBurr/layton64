extends Node3D
var file1 = "user://file1.dat"
var fileloaded=false
var contactcount=0
var puzzleid=puzzle.puzzles[global.puzzle-1]
signal dialogue
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.puzzleindex=false
	$CanvasLayer/Dialogue.visible=false
	$Player.position=global.location
	$SpringArm3D.position=global.location
	if global.indexdisabled==false:
		$CanvasLayer/Index.disabled=false
	else:
		$CanvasLayer/Index.disabled=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.laytoncontact ==true and global.hitting==true:
		laytondialogue()
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
	$CanvasLayer/Dialogue.visible=true
	global.puzzle=1
	if global.indexdisabled==true:
		$CanvasLayer/Dialogue/RichTextLabel.text="It's nice to see you Luke, here is an index of the puzzles you need to solve, while you are at it, why not give this puzzle a try?"
		global.indexdisabled=false
		await get_tree().create_timer(10).timeout
		if puzzleid["answeredcorrectly"] != true:
			get_tree().change_scene_to_file("res://puzzle.tscn")
	if puzzleid["answeredcorrectly"] != true:
		get_tree().change_scene_to_file("res://puzzle.tscn")
	else:
		global.puzzle=2
		puzzleid=puzzle.puzzles[global.puzzle-1]
		if puzzleid["answeredcorrectly"] != true:
			$CanvasLayer/Dialogue/RichTextLabel.text="Hello Luke, I have this puzzle for you."
			await get_tree().create_timer(5).timeout
			get_tree().change_scene_to_file("res://puzzle.tscn")
		else:
			global.puzzle=3
			puzzleid=puzzle.puzzles[global.puzzle-1]
			if puzzleid["answeredcorrectly"] != true:
				$CanvasLayer/Dialogue/RichTextLabel.text="Luke, I just thought up a puzzle."
				await get_tree().create_timer(5).timeout
				get_tree().change_scene_to_file("res://puzzle.tscn")
			else:
				global.puzzle=4
				puzzleid=puzzle.puzzles[global.puzzle-1]
				if puzzleid["answeredcorrectly"] != true:
					$CanvasLayer/Dialogue/RichTextLabel.text="Luke, have a go at this."
					await get_tree().create_timer(5).timeout
					get_tree().change_scene_to_file("res://puzzle.tscn")
				else:
					global.puzzle=5
					puzzleid=puzzle.puzzles[global.puzzle-1]
					if puzzleid["answeredcorrectly"] != true:
						$CanvasLayer/Dialogue/RichTextLabel.text="Luke, have a go at this."
						await get_tree().create_timer(5).timeout
						get_tree().change_scene_to_file("res://puzzle.tscn")
					else:
						global.puzzle=6
						puzzleid=puzzle.puzzles[global.puzzle-1]
						if puzzleid["answeredcorrectly"] != true:
							$CanvasLayer/Dialogue/RichTextLabel.text="I found this hidden puzzle earlier but haven't had the time to solve it. Luke, would you take a look at it?"
							await get_tree().create_timer(8).timeout
							get_tree().change_scene_to_file("res://puzzle.tscn")
						else:
							global.puzzle=7
							puzzleid=puzzle.puzzles[global.puzzle-1]
							if puzzleid["answeredcorrectly"] != true:
								$CanvasLayer/Dialogue/RichTextLabel.text="It's a lovely day to solve a puzzle, Luke."
								await get_tree().create_timer(8).timeout
								get_tree().change_scene_to_file("res://puzzle.tscn")
							else:
								global.puzzle=8
								puzzleid=puzzle.puzzles[global.puzzle-1]
								if puzzleid["answeredcorrectly"] != true:
									$CanvasLayer/Dialogue/RichTextLabel.text="This whole apprentice conundrum reminds me of a puzzle."
									await get_tree().create_timer(8).timeout
									get_tree().change_scene_to_file("res://puzzle.tscn")
								else:
									global.puzzle=9
									puzzleid=puzzle.puzzles[global.puzzle-1]
									if puzzleid["answeredcorrectly"] != true:
										$CanvasLayer/Dialogue/RichTextLabel.text="I'm getting low on puzzles, but there are still a few to spare."
										await get_tree().create_timer(8).timeout
										get_tree().change_scene_to_file("res://puzzle.tscn")
									else:
										global.puzzle=10
										puzzleid=puzzle.puzzles[global.puzzle-1]
										if puzzleid["answeredcorrectly"] != true:
											$CanvasLayer/Dialogue/RichTextLabel.text="This is the last puzzle I have in stock. Finish this, Luke."
											await get_tree().create_timer(6).timeout
											get_tree().change_scene_to_file("res://puzzle.tscn")
										else:
											$CanvasLayer/Dialogue/RichTextLabel.text="Congratulations Luke, You have solved all of my puzzles. You are now officially my apprentice. Feel free to roam the (admittedly tiny) world or start over the save file on the title screen and go for a perfect score of 360 picarats"



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
