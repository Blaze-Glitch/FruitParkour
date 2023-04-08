extends Control

@onready var ui_sounds : AudioStreamPlayer = $AudioStreamPlayer

func _on_start_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/ui/level_select.tscn")
	

#func _on_credits_pressed():
	#get_tree().change_scene_to_file("res://scenes/ui/credits.tscn")
	

func _on_quit_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().quit()
