extends Area3D



func _on_body_entered(body):
	if body.name == "Player":
		ScoreSaver.add_score(float($"../../Timer Label".time))
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		print(get_parent())
		$"../../Start/CSGBox3D".material.albedo_color.a = 0.5
		$"../../Start/CSGBox3D".material.emission_energy_multiplier = 1
		get_tree().change_scene_to_file("res://menus/game_menu.tscn")
