extends Node2D
signal loadfile
var file1 = "user://file1.dat"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if FileAccess.file_exists(file1):
		$Continue.disabled=false # Replace with function body.
		$Bonuses.disabled=false
	else:
		$Continue.disabled=true
		$Bonuses.disabled=true
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bonuses_pressed() -> void:
	global.goingtobonus=true
	loadfile1()
	get_tree().change_scene_to_file("res://puzzle_index.tscn")


func _on_continue_pressed() -> void:
	loadfile1()
	global.goingtobonus=false
	get_tree().change_scene_to_file("res://world.tscn")


func _on_new_game_pressed() -> void:
	savegame()
	global.goingtobonus=false
	get_tree().change_scene_to_file("res://Intro.tscn")

func loadfile1():
	if FileAccess.file_exists(file1):
		var file = FileAccess.open(file1, FileAccess.READ)
		var filedata = file.get_var()
		puzzle.puzzles = filedata['puzzledata']
		global.location = filedata['location']
		global.indexdisabled = filedata['indexdisabled']
		global.hintcoins = filedata['hintcoins']
		global.totalscore = filedata['totalscore']
		file.close()
	else:
		pass
