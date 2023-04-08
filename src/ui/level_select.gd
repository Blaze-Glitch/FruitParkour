extends Control

@onready var ui_sounds : AudioStreamPlayer = $AudioStreamPlayer

func _on_lvl_1_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_1.tscn")

func _on_lvl_2_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_2.tscn")

func _on_lvl_3_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_3.tscn")

func _on_lvl_4_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_4.tscn")

func _on_lvl_5_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_5.tscn")

func _on_lvl_6_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/world/level_6.tscn")

#func _on_lvl_7_pressed():
	#get_tree().change_scene_to_file("res://scenes/world/level_7.tscn")

func _on_back_button_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")


func _on_exit_button_pressed():
	ui_sounds.play()
	await get_tree().create_timer(0.16).timeout
	get_tree().quit()
