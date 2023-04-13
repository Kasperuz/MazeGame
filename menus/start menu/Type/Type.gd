extends Control


func _on_normal_pressed():

	get_tree().change_scene_to_file("res://menus/start menu/Type/Normal/normal.tscn")


func _on_custom_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/Type/Custom/Custom.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/start_menu.tscn")
