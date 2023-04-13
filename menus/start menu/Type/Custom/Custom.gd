extends Control


func _on_start_pressed():
	DataTransfer.custom = true
	DataTransfer.level = 0
	DataTransfer.size = $Size.value
	DataTransfer.turnChance = $"Turn chance".value
	get_tree().change_scene_to_file("res://world/node_3d.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/Type/Type.tscn")
