extends Control


export (String, 
	"Sun", "Mon", "Tues", "Weds", 
	"Thurs", "Fri", "Sat"
	) var weekday

onready var selected_date = CalendarGlobals.selected_date

var event_TSCN = preload("res://Calendar/CalendarWeekEvent/CalendarWeekEvent.tscn")


func _on_WeekCalendarContainer_week_changed(week):
	# event_info (dict) > year (dict) > weeks (dict) > day (dict)
	if selected_date:
		if CalendarGlobals.event_info.has(selected_date.year):
			var events = CalendarGlobals.event_info.get(selected_date.year) # All events for selected year
			if events.get(week): # Checks if week index in array
				events = events[week].duplicate() # All events for selected week
				if events.get(weekday):
					events = events.get(weekday) # All events for selected day
					clear_children()
					for event in events:
						create_event(event)


func create_event(event) -> void:
	var event_box = event_TSCN.instance()
	event_box.event_info = event
	add_child(event_box)


func clear_children() -> void:
	for child in get_children():
		child.queue_free()






#func _on_resize(new_size):
#	pass
#	new_size = (new_size.x - 132) / 7
#	if new_size > 100:
#		rect_min_size.x = new_size
	# 132 = 22 * 6 (size of divider lines * num dividers)
