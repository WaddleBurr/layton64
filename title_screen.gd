extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bonuses_pressed() -> void:
	global.goingtobonus=true
	get_tree().change_scene_to_file("res://SaveScreen.tscn")


func _on_continue_pressed() -> void:
	global.goingtobonus=false
	get_tree().change_scene_to_file("res://SaveScreen.tscn")


func _on_new_game_pressed() -> void:
	global.goingtobonus=false
	get_tree().change_scene_to_file("res://puzzle.tscn")
