extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_file_1_pressed() -> void:
	if global.goingtobonus==true:
		get_tree().change_scene_to_file("res://Bonuses.tscn") # Replace with function body.
	else:
		get_tree().change_scene_to_file("res://world.tscn")


func _on_file_2_pressed() -> void:
	if global.goingtobonus==true:
		get_tree().change_scene_to_file("res://Bonuses.tscn") # Replace with function body.
	else:
		get_tree().change_scene_to_file("res://world.tscn")


func _on_file_3_pressed() -> void:
	if global.goingtobonus==true:
		get_tree().change_scene_to_file("res://Bonuses.tscn") # Replace with function body.
	else:
		get_tree().change_scene_to_file("res://world.tscn")
