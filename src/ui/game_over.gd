extends Control

func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/level_select.tscn")

func _on_quit_game_pressed():
	get_tree().quit()
