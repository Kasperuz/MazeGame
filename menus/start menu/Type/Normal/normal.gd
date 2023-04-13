extends Control

func _on_back_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/Type/Type.tscn")


func _on_impossible_pressed():
	DataTransfer.custom = false
	DataTransfer.level = 3
	DataTransfer.size = 100
	DataTransfer.turnChance = 0.5
	get_tree().change_scene_to_file("res://world/node_3d.tscn")

func _on_hard_pressed():
	DataTransfer.custom = false
	DataTransfer.level = 2
	DataTransfer.size = 50
	DataTransfer.turnChance = 0.4
	get_tree().change_scene_to_file("res://world/node_3d.tscn")

func _on_normal_pressed():
	DataTransfer.custom = false
	DataTransfer.level = 1
	DataTransfer.size = 30
	DataTransfer.turnChance = 0.3
	get_tree().change_scene_to_file("res://world/node_3d.tscn")

func _on_easy_pressed():
	DataTransfer.custom = false
	DataTransfer.level = 0
	DataTransfer.size = 10
	DataTransfer.turnChance = 0.2
	get_tree().change_scene_to_file("res://world/node_3d.tscn")
