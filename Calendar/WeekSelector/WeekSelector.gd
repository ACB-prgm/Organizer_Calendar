extends HBoxContainer


onready var weekLabel := $Label

var week := 1 setget set_week

signal week_changed(_week, year_change)


func _ready():
	change_week(0)


func _on_LeftButton_pressed():
	change_week(-1)

func _on_RightButton_pressed():
	change_week(1)


func change_week(change:int):
	week += change
	
	var year_change : int = 0
	if week < 1:
		year_change = -1
		week = 52
	elif week > 52:
		year_change = 1
		week = 1
	
	emit_signal("week_changed", week, year_change)
	
	weekLabel.text = "WEEK %s" % str(week).pad_zeros(2)


func set_week(new_week):
	week = new_week
	weekLabel.text = "WEEK %s" % str(new_week).pad_zeros(2)
