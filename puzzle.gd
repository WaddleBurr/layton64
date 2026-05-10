extends Node2D
var i = 0

var puzzleid=puzzle.puzzles[global.puzzle-1]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/RichTextLabel.add_theme_font_size_override("normal_font_size", 14)
#	getpuzzle()
	puzzlestartup()
	$CanvasLayer/HintScreen.visible=false
	$CanvasLayer.visible=false
	$CanvasLayer/RichTextLabel.visible=false
	$CanvasLayer/UI/PuzzleNumber.visible=false
	$CanvasLayer/UI/Picarats.visible=false
	$CanvasLayer/UI/Coin.visible=false
	$CanvasLayer/TextAnswer.visible=false
	$CanvasLayer/Submit.visible=false
	$CanvasLayer/ButtonA.visible=false
	$CanvasLayer/ButtonB.visible=false
	$CanvasLayer/ButtonC.visible=false
	$CanvasLayer/ButtonD.visible=false
	$PuzzleUI/Back.visible=false
	$PuzzleUI/Memo.visible=false
	$PuzzleUI/Hint.visible=false
	$PuzzleUI.visible=false
	$CanvasLayer/Memo/Memoback.visible=false
	$CanvasLayer/Memo/Sprite2D.visible=false
	$CanvasLayer/HBoxContainer.visible = false
	$CanvasLayer/HBoxContainer/Digit1.visible=false
	$CanvasLayer/HBoxContainer/Digit2.visible=false
	$CanvasLayer/HBoxContainer/Digit3.visible=false
	$CanvasLayer/HBoxContainer/Digit4.visible=false
	
	if global.puzzletype==0:
		@warning_ignore("integer_division")
		global.punishment=int(global.originalpicarats/5)
	if global.puzzletype==1:
		@warning_ignore("integer_division")
		global.punishment=global.originalpicarats/2
	if global.puzzletype==2:
		@warning_ignore("integer_division")
		global.punishment=global.originalpicarats/4
	i = 0
	$CanvasLayer/UI/PuzzleNumber.text="No. " + str(global.puzzle).pad_zeros(3)
	$PuzzleAnnouncement/Sprite2D5/VBoxContainer/PuzzleNumber.text="No. " + str(global.puzzle).pad_zeros(3)
	$PuzzleAnnouncement/Sprite2D5/VBoxContainer/Title.text=str(global.puzzletitle)
	$CanvasLayer/UI/Coin.text=str(global.hintcoins) + " coins"
	$PicaratAnnouncement/Sprite2D3/HBoxContainer/Total.text=str(global.totalscore) + " picarats"
	$PicaratAnnouncement/Sprite2D5/VBoxContainer/Score.text=str(global.picarats) + "/" + str(global.originalpicarats)
	$AnimationPlayer.play("begin puzzle")
	await get_tree().create_timer(2).timeout
	if puzzleid["needspunishment"] == true and puzzleid["maxedpunishment"] == false and puzzleid["answeredcorrectly"]== false: 
		while i < global.punishment:
			global.picarats-=1
			@warning_ignore("integer_division")
			$PicaratAnnouncement/Sprite2D5/VBoxContainer/Score.text=str(global.picarats) + "/" + str(global.originalpicarats)
			if global.picarats < 1:
				global.picarats=1
			if global.punishment > 1:
				@warning_ignore("integer_division")
				await get_tree().create_timer(2/global.punishment).timeout
				i+=1
		puzzleid["picarats"] = global.picarats
		puzzleid["needspunishment"] = false
	@warning_ignore("integer_division")
	await get_tree().create_timer(3-(2/global.punishment)*i).timeout
	$CanvasLayer/UI/Picarats.text=str(global.picarats) + " picarats"
	$PuzzleAnnouncement.visible=false
	$PicaratAnnouncement.visible=false
	$CanvasLayer.visible=true
	$CanvasLayer/UI/PuzzleNumber.visible=true
	$CanvasLayer/UI/Picarats.visible=true
	$CanvasLayer/UI/Coin.visible=true
	global.cansubmit=false
	puzzlesetup()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.cansubmit == false:
		$CanvasLayer/Submit.text="Input\nAnswer"
	else:
		$CanvasLayer/Submit.text="Submit"


func puzzlestartup():
	global.puzzletitle=puzzleid["puzzletitle"]
	global.originalpicarats=puzzleid["originalpicarats"]
	global.puzzletype=puzzleid["puzzletype"]
	global.picarats=puzzleid["picarats"]
	global.puzzletext=puzzleid["puzzletext"]
	global.hintsgiven=puzzleid["hintsgiven"]
	global.puzzlepicture=puzzleid["puzzlepicture"]
	if global.puzzletype==0:
		global.puzzlelength=puzzleid["puzzlelength"]
	if global.puzzletype==1:
		$CanvasLayer/ButtonA.text=puzzleid["ButtonA"]
		$CanvasLayer/ButtonB.text=puzzleid["ButtonB"]
	if global.puzzletype==2:
		$CanvasLayer/ButtonA.text=puzzleid["ButtonA"]
		$CanvasLayer/ButtonB.text=puzzleid["ButtonB"]
		$CanvasLayer/ButtonC.text=puzzleid["ButtonC"]
		$CanvasLayer/ButtonD.text=puzzleid["ButtonD"]
func puzzlesetup():
	$CanvasLayer/RichTextLabel.text=global.puzzletext
	$PuzzleUI/Memo.visible=true
	$PuzzleUI/Hint.visible=true
	$PuzzleUI.visible=true
	$PuzzleUI/Back.visible=true
	if global.puzzletype == 0:
		if global.cansubmit==true:
			if global.puzzlelength==0:
				$CanvasLayer/TextAnswer.visible=true
			if global.puzzlelength!=0:
				$CanvasLayer/HBoxContainer.visible=true
			if global.puzzlelength==1:
				$CanvasLayer/HBoxContainer/Digit1.visible=true
			if global.puzzlelength==2:
				$CanvasLayer/HBoxContainer/Digit1.visible=true
				$CanvasLayer/HBoxContainer/Digit2.visible=true
			if global.puzzlelength==3:
				$CanvasLayer/HBoxContainer/Digit1.visible=true
				$CanvasLayer/HBoxContainer/Digit2.visible=true
				$CanvasLayer/HBoxContainer/Digit3.visible=true
			if global.puzzlelength==4:
				$CanvasLayer/HBoxContainer/Digit1.visible=true
				$CanvasLayer/HBoxContainer/Digit2.visible=true
				$CanvasLayer/HBoxContainer/Digit3.visible=true
				$CanvasLayer/HBoxContainer/Digit4.visible=true
			$PuzzleUI/Back.text="Back"
		else:
			$CanvasLayer/TextAnswer.visible=false
			$CanvasLayer/HBoxContainer/Digit1.visible=false
			$CanvasLayer/HBoxContainer/Digit2.visible=false
			$CanvasLayer/HBoxContainer/Digit3.visible=false
			$CanvasLayer/HBoxContainer/Digit4.visible=false
			$CanvasLayer/HBoxContainer/Digit4.visible=false
			$PuzzleUI/Back.text="Quit"
		$CanvasLayer/Submit.visible=true
	if global.puzzletype == 1:
		$CanvasLayer/ButtonA.visible=true
		$CanvasLayer/ButtonB.visible=true
		$PuzzleUI/Back.text="Quit"
	if global.puzzletype == 2:
		$CanvasLayer/ButtonA.visible=true
		$CanvasLayer/ButtonB.visible=true
		$CanvasLayer/ButtonC.visible=true
		$CanvasLayer/ButtonD.visible=true
		$PuzzleUI/Back.text="Quit"
	$CanvasLayer/RichTextLabel.visible=true

func _on_button_pressed() -> void:
	if global.cansubmit == true:
		if global.puzzle == 1:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="0" or $CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="") and $CanvasLayer/HBoxContainer/Digit2.text.strip_edges().to_lower()=="8":
				global.correct=true
			else:
				global.correct=false
		if global.puzzle == 4:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="6"):
				global.correct=true
			else:
				global.correct=false
		if global.puzzle == 5:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="1" and $CanvasLayer/HBoxContainer/Digit2.text.strip_edges().to_lower()=="3"):
				global.correct=true
			else:
				global.correct=false
		if global.puzzle == 6:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="3"):
				global.correct=true
			else:
				global.correct=false
		if global.puzzle == 9:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="5"):
				global.correct=true
			else:
				global.correct=false
		if global.puzzle == 10:
			if ($CanvasLayer/HBoxContainer/Digit1.text.strip_edges().to_lower()=="4"):
				global.correct=true
			else:
				global.correct=false
		$AnimationPlayer.play("end puzzle")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Solveanimation.tscn")
	if global.cansubmit == false:
		$AnimationPlayer.play("movetoinputscreen")
		global.cansubmit=true
		puzzlesetup()


func _on_button_a_pressed() -> void:
	if global.puzzle == 2:
		global.correct=false
	if global.puzzle == 3:
		global.correct=false
	if global.puzzle == 7:
		global.correct=true
	if global.puzzle == 8:
		global.correct=false
	$AnimationPlayer.play("end puzzle")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Solveanimation.tscn")


func _on_button_b_pressed() -> void:
	if global.puzzle == 2:
		global.correct=true
	if global.puzzle == 3:
		global.correct=false
	if global.puzzle == 7:
		global.correct=false
	if global.puzzle == 8:
		global.correct=false
	$AnimationPlayer.play("end puzzle")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Solveanimation.tscn")
 # Replace with function body.


func _on_button_c_pressed() -> void:
	if global.puzzle == 3:
		global.correct=true
	if global.puzzle == 7:
		global.correct=false
	if global.puzzle == 8:
		global.correct=true
	$AnimationPlayer.play("end puzzle")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Solveanimation.tscn")


func _on_button_d_pressed() -> void:
	if global.puzzle == 3:
		global.correct=false
	if global.puzzle == 7:
		global.correct=false
	if global.puzzle == 8:
		global.correct=false
	$AnimationPlayer.play("end puzzle")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Solveanimation.tscn")


func _on_back_pressed() -> void:
	if global.cansubmit==false or global.puzzletype != 0:
		$AnimationPlayer.play("end puzzle")
		get_tree().change_scene_to_file("res://puzzle_index.tscn")
	else:
		$AnimationPlayer.play("movetopicturescreen") # Replace with function body.
		global.cansubmit=false
		puzzlesetup()


func _on_memo_pressed() -> void:
	$AnimationPlayer.play("memoon") # Replace with function body.
	$PuzzleUI/Memo.visible=false
	$CanvasLayer/Memo/Sprite2D.visible=true
	$PuzzleUI/Back.visible=false
	$PuzzleUI/Hint.visible=false
	$CanvasLayer/ButtonA.disabled=true
	$CanvasLayer/ButtonB.disabled=true
	$CanvasLayer/ButtonC.disabled=true
	$CanvasLayer/ButtonD.disabled=true
	$CanvasLayer/Submit.disabled=true
	$CanvasLayer/HBoxContainer/Digit1.editable=false
	$CanvasLayer/HBoxContainer/Digit2.editable=false
	$CanvasLayer/HBoxContainer/Digit3.editable=false
	$CanvasLayer/HBoxContainer/Digit4.editable=false
	$CanvasLayer/TextAnswer.editable=false
	global.memoon=true


func _on_memoback_pressed() -> void:
	$AnimationPlayer.play("memooff") # Replace with function body.
	$PuzzleUI/Back.visible=true
	$PuzzleUI/Hint.visible=true
	$PuzzleUI/Memo.visible=true
	$CanvasLayer/ButtonA.disabled=false
	$CanvasLayer/ButtonB.disabled=false
	$CanvasLayer/ButtonC.disabled=false
	$CanvasLayer/ButtonD.disabled=false
	$CanvasLayer/Submit.disabled=false
	$CanvasLayer/HBoxContainer/Digit1.editable=true
	$CanvasLayer/HBoxContainer/Digit2.editable=true
	$CanvasLayer/HBoxContainer/Digit3.editable=true
	$CanvasLayer/HBoxContainer/Digit4.editable=true
	$CanvasLayer/TextAnswer.editable=true
	global.memoon=false


func _on_hint_pressed() -> void:
	$CanvasLayer/HintScreen.visible=true # Replace with function body.
	$PuzzleUI.visible=false


func _on_hintback_pressed() -> void:
	$CanvasLayer/HintScreen.visible=false # Replace with function body.
	$PuzzleUI.visible=true
