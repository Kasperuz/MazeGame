extends Area3D

func _on_body_exited(body):
	if body.name == "Player":
		$StaticBody3D.collision_layer = 1
		$CSGBox3D.material.albedo_color.a = 1
		$CSGBox3D.material.emission_energy_multiplier = 0
		$"../Timer Label".on = true
