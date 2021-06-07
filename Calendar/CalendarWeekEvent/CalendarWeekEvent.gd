extends Panel


var event_info = {
	"title" : "null",
	"start_time": null,
	"end_time" : null,
	"priority" : 4,
	"date" : null,
	"reminders" : null
}

var start_time_line
var end_time_line


func create_event_info(start_time, title="Unamed Event", end_time=null, date=null, priority=4,reminders=null) -> void:
	event_info["start_time"] = start_time
	event_info["title"] = title
	
	if !end_time:
		end_time = start_time.duplicate()
		end_time[0] += 1
	event_info["end_time"] = end_time
	
	event_info["date"] = date
	event_info["priority"] = priority
	event_info["reminders"] = reminders


func refresh_event() -> void:
	$Label.text = event_info.get("title")
	start_time_line = TimeLineLocs.locs.get(event_info.get("start_time"))
	end_time_line = TimeLineLocs.locs.get(event_info.get("end_time"))
	_on_CalendarWeekEvent_resized()


func _on_CalendarWeekEvent_resized():
	if start_time_line:
		rect_position.y = start_time_line.rect_position.y + start_time_line.rect_size.y/2.0
		rect_size.y = end_time_line.rect_position.y - start_time_line.rect_position.y
	else:
		refresh_event()
