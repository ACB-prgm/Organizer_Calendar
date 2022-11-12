extends Popup

onready var selected_date = CalendarGlobals.selected_date
onready var dateHbox = $Panel/VBoxContainer/DateHBoxContainer
onready var starttimeHbox = $Panel/VBoxContainer/StartTimeHBoxContainer
onready var endtimeHbox = $Panel/VBoxContainer/EndTimeHBoxContainer


func _ready():
	var children = dateHbox.get_children()
	for month in Calendar.MONTH_NAME:
		children[1].add_item(month, Calendar.get_month_from_name(month))
	for year in range(selected_date.year, selected_date.year + 11):
		children[3].add_item(str(year), year)

	yield(get_tree().create_timer(0.01), "timeout")
	
	children = starttimeHbox.get_children()
	for time in range(1, 13):
		children[1].add_item(str(time).pad_zeros(2), time)
	for minute in range(4):
		minute = minute * 15
		children[2].add_item(str(minute).pad_zeros(2), minute)
	for AMPM in ["AM", "PM"]:
		children[3].add_item(AMPM)
	
	children = endtimeHbox.get_children()
	for time in range(1, 13):
		children[1].add_item(str(time).pad_zeros(2), time)
	for minute in range(4):
		minute = minute * 15
		children[2].add_item(str(minute).pad_zeros(2), minute)
	for AMPM in ["AM", "PM"]:
		children[3].add_item(AMPM)


func _on_Popup_about_to_show():
	var children = dateHbox.get_children()
	
	for day in Calendar.get_days_in_month(selected_date.month, selected_date.year):
		children[2].add_item(str(day).pad_zeros(2), day)
	
	children[1].select(children[1].get_item_index(selected_date.month))
	children[2].select(selected_date.day)
	children[3].select(children[3].get_item_index(selected_date.year))
	
	children = starttimeHbox.get_children()
	var hour = OS.get_datetime()["hour"]
	var AMPM := 0
	if OS.get_datetime()["hour"] > 12: 
		hour = OS.get_datetime()["hour"] - 12
		AMPM = 1

	children[1].select(hour-1)
	children[2].select(children[2].get_item_index(stepify(OS.get_datetime()["minute"], 15)))
	children[3].select(AMPM)
	
	children = endtimeHbox.get_children()
	children[1].select(clamp(hour, 1, 11))
	children[2].select(children[2].get_item_index(stepify(OS.get_datetime()["minute"], 15)))
	children[3].select(AMPM)
