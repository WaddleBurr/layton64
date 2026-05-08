extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("light") # Replace with function body.
	if global.correct==true:
		$Luke2/AnimationPlayer.play("puzzlesolvecorrect")
		$AnimationPlayer2.play("lukefacecorrect")
	else:
		$Luke2/AnimationPlayer.play("puzzlesolveincorrect")
		$AnimationPlayer2.play("lukefaceincorrect")
	await get_tree().create_timer(8.2/$AnimationPlayer.speed_scale).timeout
	get_tree().change_scene_to_file("res://Correct-Incorrect.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
