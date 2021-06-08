extends Control

onready var yearLabel = $YearLabel
onready var monthLabel = $MonthLabel
onready var weekSelector = $WeekSelector
onready var weekdayLabels = $DaysHBoxContainer.get_children()
onready var selected_date = CalendarGlobals.selected_date


func _ready():
	weekdayLabels.erase($DaysHBoxContainer/Space)
	var week_info = Calendar.get_week_info(selected_date.day, selected_date.month, selected_date.year)
	for day_num in range(7):
		var day_info = week_info[day_num]
		weekdayLabels[day_num].text = "%s %s" % [day_info[0], day_info[2]]

	yearLabel.set_text(str(selected_date.year))
	monthLabel.set_text(str(Calendar.get_month_name(selected_date.month)))
	weekSelector.week = Calendar.get_week_number(selected_date.day, selected_date.month, selected_date.year)


func _on_WeekSelector_week_changed(_week):
	var changed_month := false
	var last_month : String
	
	if selected_date:
		var week_info = Calendar.weeks.get(selected_date.year)[_week-1]
		for day_num in range(7):
			if day_num <= week_info.size()-1:
				var day_info = week_info[day_num]
				weekdayLabels[day_num].text = "%s %s" % [day_info[0], day_info[2]]
				
				if day_info[1] != last_month:
					changed_month = true
				last_month = day_info[1]
			else: # NEW YEAR
				pass
	
	if changed_month:
		monthLabel.text = last_month
