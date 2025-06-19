extends Node2D

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts/main.tscn")


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts/how_to_play.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
