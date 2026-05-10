extends Node2D
var puzzleid=puzzle.puzzles[global.puzzle-1]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.correct==true:
		$CanvasLayer/Sprite2D/Label.text="CORRECT"
	else:
		$CanvasLayer/Sprite2D/Label.text="INCORRECT"
	if global.correct==false:
		$CanvasLayer2/Sprite2D.visible=false
		$CanvasLayer2/Sprite2D2.visible=true
		puzzleid["incorrectguesses"]+=1
		if puzzleid["incorrectguesses"]==1 or puzzleid["incorrectguesses"]==2 and puzzleid["puzzletype"] != 1:
			puzzleid["needspunishment"]=true
		if puzzleid["incorrectguesses"] > 2 or puzzleid["incorrectguesses"]==2 and puzzleid["puzzletype"] == 1:
			puzzleid["maxedpunishment"]=true
		$AnimationPlayer.play("Incorrect")
		await get_tree().create_timer(3).timeout
	if global.correct==true:
		$CanvasLayer2/Sprite2D.visible=true
		$CanvasLayer2/Sprite2D2.visible=false
		$AnimationPlayer.play("Correct")
		await get_tree().create_timer(3).timeout
		while global.picarats > 0:
			global.picarats-=1
			global.totalscore+=1
			if global.picarats > 1:
				await get_tree().create_timer(1/global.picarats).timeout
		puzzleid["answeredcorrectly"]=true
		puzzleid["picarats"]=0
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("End")
	await get_tree().create_timer(1).timeout
	if global.correct==true:
		global.correct==false
		if global.puzzleindex==true:
			get_tree().change_scene_to_file("res://puzzle_index.tscn")
		else:
			get_tree().change_scene_to_file("res://world.tscn")
	else:
		global.correct==false
		get_tree().change_scene_to_file("res://puzzle.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer2/Sprite2D/Picarats.text = str(int(global.picarats))
	$CanvasLayer2/Sprite2D/Total.text = str(int(global.totalscore))
	
