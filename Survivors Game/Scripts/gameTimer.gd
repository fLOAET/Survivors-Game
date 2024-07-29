extends Panel


var time = 0
var minutes = 0
var seconds = 0
@onready var timer = $"../Timer"

func _process(delta):
	time += delta
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	timer.text = "%02d:%02d" % [minutes, seconds]
