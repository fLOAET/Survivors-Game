extends Label

var time = 0
var timerOn = true

func _process(delta):
	if (timerOn == true):
		time += delta
	
	var secs = fmod(time,60)
	var mins = fmod(time, 60*60) / 60
