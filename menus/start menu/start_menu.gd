extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/Type/Type.tscn")


func _on_quit_pressed():
	get_tree().quit()
