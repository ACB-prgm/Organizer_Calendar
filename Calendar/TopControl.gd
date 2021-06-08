extends Control

onready var yearLabel = $YearLabel
onready var monthLabel = $MonthLabel
onready var weekSelector = $WeekSelector
onready var weekdayLabels = $DaysHBoxContainer.get_children()
onready var selected_date = CalendarGlobals.selected_date

var calendar := Calendar.new()


func _ready():
	weekdayLabels.erase($DaysHBoxContainer/Space)

	yearLabel.set_text(str(selected_date.year))
	monthLabel.set_text(str(calendar.get_month_name(selected_date.month)))
	weekSelector.week = calendar.get_week_number(selected_date.day, selected_date.month, selected_date.year)
	
	var days_in_month : int = calendar.get_days_in_month(selected_date.month, selected_date.year)
	
	
	for day in range(1, days_in_month+1):
		
		var penis = calendar.get_weekday(day, selected_date.month, selected_date.year)
		if penis == 0:
			print("new week")
		
		prints(calendar.get_weekday_name(day, selected_date.month, selected_date.year), str(day).pad_zeros(2))


func _on_WeekSelector_week_changed(_week):
	pass # Replace with function body.
