extends Control

func secToText(input):
	var miliSec = int(floor(input * 60)) % 60
	var miliSecStr = str(miliSec)
	if len(miliSecStr) == 1:
		miliSecStr = '0' + miliSecStr
		
	var sec = int(floor(input)) % 60
	var secStr = str(sec)
	if len(secStr) == 1:
		secStr = '0' + secStr
		
	var min = int(floor(input / 60))
	var minStr = str(min)
	if len(minStr) == 1:
		minStr = '0' + minStr
	
	return minStr +' : '+ secStr +' : '+ miliSecStr

func _ready():
	if DataTransfer.custom:
		$Score.text = secToText(ScoreSaver.get_score())
		$Score/High_score.text = ""
	elif ScoreSaver.is_high_score():

		$Score.text = secToText(ScoreSaver.get_score())
		$Score/High_score.text = "High Score!"
		
	else:
		$Score.text = secToText(ScoreSaver.get_score())
		$Score/High_score.text = "High Score: " +  secToText(ScoreSaver.get_high_score())
	
	if DataTransfer.level == 0:
		$Score/High_score/dificulty.text = "Easy"
	elif DataTransfer.level == 1:
		$Score/High_score/dificulty.text = "Normal"
	elif DataTransfer.level == 2:
		$Score/High_score/dificulty.text = "Hard"
	elif DataTransfer.level == 3:
		$Score/High_score/dificulty.text = "Impossible" 

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/start menu/start_menu.tscn")

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://world/node_3d.tscn")
