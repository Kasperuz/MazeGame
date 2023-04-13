extends Node3D

var block = preload("res://world/generator/Block.tscn")
var boll = preload("res://world/generator/mål/Boll.tscn")
var start = preload("res://world/generator/start/Start.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	DataTransfer.setValue($"Labyrinth Generator")
	var labyrint = $"Labyrinth Generator".generate()
	$"Labyrinth Generator".findGoal(labyrint)
	for x in range(len(labyrint)):
		for y in range(len(labyrint[x])):
			if !(labyrint[x][y] == 1 or labyrint[x][y] == 5 or labyrint[x][y] == 6):
				for i in range(5):
					var instanse = block.instantiate()
					add_child(instanse)
					instanse.position = Vector3(float(x-len(labyrint)/2),i,float(y-len(labyrint[x])/2))
			if labyrint[x][y] == 6:
				var instanse = boll.instantiate()
				add_child(instanse)
				instanse.position = Vector3(float(x-len(labyrint)/2),1,float(y-len(labyrint[x])/2))
			if labyrint[x][y] == 5:
				var instanse = start.instantiate()
				add_child(instanse)
				instanse.position = Vector3(float(x-len(labyrint)/2),1,float(y-len(labyrint[x])/2))	
	$Player.position = Vector3(float($"Labyrinth Generator".StartPosition.x-len(labyrint)/2),1,float($"Labyrinth Generator".StartPosition.y-3-len(labyrint[$"Labyrinth Generator".StartPosition.x])/2))
	$Player/Node3D.rotation_degrees.y += 180
