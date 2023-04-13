extends Control

func _on_main_menu_pressed():
	get_tree().paused = false
	visible = false
	$"../Start/CSGBox3D".material.albedo_color.a = 0.5
	$"../Start/CSGBox3D".material.emission_energy_multiplier = 1
	get_tree().change_scene_to_file("res://menus/start menu/start_menu.tscn")

func _on_back_to_game_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	$"../pause".visible = false
