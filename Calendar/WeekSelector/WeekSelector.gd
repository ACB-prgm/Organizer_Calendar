extends HBoxContainer


onready var weekLabel = $Label

var week = 01

signal week_changed(_week)


func _ready():
	change_week(0)


func _on_LeftButton_pressed():
	change_week(-1)

func _on_RightButton_pressed():
	change_week(1)


func change_week(change:int):
	week += change
	
	if week < 1:
		week = 52
	elif week > 52:
		week = 1
	
	emit_signal("week_changed", week)
	
	var weekStr: String
	if week < 10:
		weekStr = "0%s" % week
	else:
		weekStr = str(week)
	
	weekLabel.text = "WEEK %s" % weekStr
