extends Node

var resorce = load("res://Score saver/Score.tres")

func save_high_score():
	ResourceSaver.save(resorce,resorce.path)
func load_high_score():
	resorce = ResourceLoader.load(resorce.path)
func get_high_score():
	load_high_score()
	return resorce.highScore[DataTransfer.level]
func get_score():
	return resorce.score
func is_high_score():
	return resorce.score <= resorce.highScore[DataTransfer.level] or resorce.highScore[DataTransfer.level] == 0
func add_score(score: float):
	resorce.score = score
	if is_high_score():
		resorce.highScore[DataTransfer.level] = resorce.score
		save_high_score()
func reset_high_score():
	resorce.highScore = [0.0,0.0,0.0,0.0]
	save_high_score()
