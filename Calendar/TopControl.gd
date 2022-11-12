extends Control

onready var yearLabel = $YearLabel
onready var monthLabel = $MonthLabel
onready var weekSelector = $WeekSelector
onready var weekdayLabels = $DaysHBoxContainer.get_children()
onready var selected_date = CalendarGlobals.selected_date


func _ready():
	CalendarGlobals.connect("its_fucked", self, "_on_its_fucked")
	weekdayLabels.erase($DaysHBoxContainer/Space)
	var week_info = Calendar.get_week_info(selected_date.day, selected_date.month, selected_date.year)
	for day_num in range(7):
		var day_info = week_info[day_num]
		weekdayLabels[day_num].text = "%s %s" % [day_info[0], day_info[2]]

	yearLabel.set_text(str(selected_date.year))
	monthLabel.set_text(str(Calendar.get_month_name(selected_date.month)))
	weekSelector.week = Calendar.get_week_number(selected_date.day, selected_date.month, selected_date.year)


func _on_WeekSelector_week_changed(_week, year_change):
	if selected_date:
		for day_num in range(7):
			#(day_num <= week_info.size()-1): # checks if day_num index in array
			if year_change: # Change Year
				selected_date.year += year_change
				yearLabel.set_text(str(selected_date.year))
				if !Calendar.weeks.get(selected_date.year):
					Calendar.weeks[selected_date.year] = Calendar.create_weeks_in_year(selected_date.year)
				
				year_change = 0
			
			var week_info = Calendar.weeks.get(selected_date.year)[_week]
			var day_info = week_info[day_num]
			weekdayLabels[day_num].text = "%s %s" % [day_info[0], day_info[2]]
			
			if day_num == 0: # Change Month
				if day_info[1] != Calendar.get_month_name(selected_date.month):
					selected_date.month += Calendar.get_month_from_name(day_info[1]) - selected_date.month
					monthLabel.set_text(Calendar.get_month_name(selected_date.month))


func _on_AddEventButton_pressed():
	AddEventPopup.popup()

func _on_its_fucked():
	AddEventPopup.popup()
