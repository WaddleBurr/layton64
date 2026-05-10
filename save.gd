extends Node

var file1 = "user://file1.json"
func _ready():
	pass
func loadfile1():
	if FileAccess.file_exists(file1):
		var file = FileAccess.open(file1, FileAccess.READ)
		puzzle.puzzles = file.get_var()
	else:
		pass

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
