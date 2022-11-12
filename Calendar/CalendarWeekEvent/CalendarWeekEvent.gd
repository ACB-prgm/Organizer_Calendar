extends Panel


var event_info : CalendarEventInfo

var start_time_line
var end_time_line


func refresh_event() -> void:
	$Label.text = event_info.title
	
	start_time_line = CalendarGlobals.TimeLinelocs.get(event_info.start_time)
	end_time_line = CalendarGlobals.TimeLinelocs.get(event_info.end_time)
	
	_on_CalendarWeekEvent_resized()


func _on_CalendarWeekEvent_resized():
	if start_time_line:
		rect_position.y = start_time_line.rect_position.y + start_time_line.rect_size.y/2.0
		rect_size.y = end_time_line.rect_position.y - start_time_line.rect_position.y
	else:
		refresh_event()








#func create_event_info(start_time, title="Unamed Event", end_time=null, date=null, priority=4,reminders=null) -> void:
#	event_info["start_time"] = start_time
#	event_info["title"] = title
#
#	if !end_time:
#		end_time = start_time.duplicate()
#		end_time[0] += 1
#	event_info["end_time"] = end_time
#
#	event_info["date"] = date
#	event_info["priority"] = priority
#	event_info["reminders"] = reminders
