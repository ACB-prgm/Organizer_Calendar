extends HBoxContainer


onready var weekLabel = $Label

var week = 01 setget set_week

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
	
	weekLabel.text = "WEEK %s" % str(week).pad_zeros(2)


func set_week(new_week):
	week = new_week
	weekLabel.text = "WEEK %s" % str(new_week).pad_zeros(2)
