extends Node2D
var arrowadd=0
var puzzleid=puzzle.puzzles
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setuppuzzlelist() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setuppuzzlelist():
	$VBoxContainer/Puzzle001.visible=true
	$VBoxContainer/Puzzle002.visible=true
	$VBoxContainer/Puzzle003.visible=true
	$VBoxContainer/Puzzle004.visible=true
	$VBoxContainer/Puzzle005.visible=true
	$VBoxContainer/Puzzle006.visible=true
	$VBoxContainer/Puzzle007.visible=true
	$VBoxContainer/Puzzle008.visible=true
	if arrowadd == 0:
		$VBoxContainer/Puzzle001.text="No." + str(1+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[0+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle002.text="No." + str(2+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[1+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle003.text="No." + str(3+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[2+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle004.text="No." + str(4+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[3+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle005.text="No." + str(5+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[4+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle006.text="No." + str(6+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[5+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle007.text="No." + str(7+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[6+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle008.text="No." + str(8+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[7+arrowadd*8]["puzzletitle"]
	else:
		$VBoxContainer/Puzzle001.text="No." + str(1+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[0+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle002.text="No." + str(2+arrowadd*8).pad_zeros(3) + ": " + puzzle.puzzles[1+arrowadd*8]["puzzletitle"]
		$VBoxContainer/Puzzle003.visible=false
		$VBoxContainer/Puzzle004.visible=false
		$VBoxContainer/Puzzle005.visible=false
		$VBoxContainer/Puzzle006.visible=false
		$VBoxContainer/Puzzle007.visible=false
		$VBoxContainer/Puzzle008.visible=false

func _on_forward_arrow_pressed() -> void:
	arrowadd+=1 # Replace with function body.
	if not arrowadd > 1:
		setuppuzzlelist()
	else:
		arrowadd=1

func _on_backward_arrow_pressed() -> void:
	arrowadd-=1 # Replace with function body.
	if not arrowadd < 0:
		setuppuzzlelist()
	else:
		arrowadd=0

func _on_solve_pressed() -> void:
	get_tree().change_scene_to_file("res://puzzle.tscn") # Replace with function body.




func _on_puzzle_001_pressed() -> void:
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle001.button_pressed=true
	global.puzzle=1+arrowadd*8


func _on_puzzle_002_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=true
	global.puzzle=2+arrowadd*8


func _on_puzzle_003_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=true
	global.puzzle=3+arrowadd*8


func _on_puzzle_004_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=true
	global.puzzle=4+arrowadd*8


func _on_puzzle_005_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=true
	global.puzzle=5+arrowadd*8

func _on_puzzle_006_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=true
	global.puzzle=6+arrowadd*8


func _on_puzzle_007_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=true
	global.puzzle=7+arrowadd*8


func _on_puzzle_008_pressed() -> void:
	$VBoxContainer/Puzzle001.button_pressed=false
	$VBoxContainer/Puzzle002.button_pressed=false
	$VBoxContainer/Puzzle003.button_pressed=false
	$VBoxContainer/Puzzle004.button_pressed=false
	$VBoxContainer/Puzzle005.button_pressed=false
	$VBoxContainer/Puzzle006.button_pressed=false
	$VBoxContainer/Puzzle007.button_pressed=false
	$VBoxContainer/Puzzle008.button_pressed=true
	global.puzzle=8+arrowadd*8
