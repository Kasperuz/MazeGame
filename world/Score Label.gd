extends Label

@export var time := 0.0
var on := false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if on:
		time += delta
		var miliSec = int(floor(time * 60)) % 60
		var miliSecStr = str(miliSec)
		if len(miliSecStr) == 1:
			miliSecStr = '0' + miliSecStr
			
		var sec = int(floor(time)) % 60
		var secStr = str(sec)
		if len(secStr) == 1:
			secStr = '0' + secStr
			
		var min = int(floor(time / 60))
		var minStr = str(min)
		if len(minStr) == 1:
			minStr = '0' + minStr
		
		text = minStr +' : '+ secStr +' : '+ miliSecStr
