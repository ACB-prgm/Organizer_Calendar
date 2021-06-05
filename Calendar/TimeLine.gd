extends HBoxContainer


var label : Label
var line : HSeparator

var time


func init(minutes, line_style, color: Color):
	line = $HSeparator
	line.set("custom_styles/separator", line_style)
	
	label = $Label
	label.set_text(min_to_time_string(minutes))
	label.set("custom_colors/font_color", color)


func _on_resize(_new_size):
	TimeLineLocs.locs[time] = rect_global_position.y


func min_to_time_string(mins:int) -> String:
	var AM_PM := "AM"
	var hour : = int(mins/60.0)
	var minutes = mins%60
	
	
	if hour == 0:
		hour = 12
	elif hour == 12:
		AM_PM = "PM"
	elif hour >= 13:
		hour = hour - 12
		AM_PM = "PM"
	
	var time_string
	if mins % 60 == 0:
		time_string =  "%s %s" % [hour, AM_PM]
	else:
		time_string = str(minutes)
	
	
	time = [hour, minutes, AM_PM]
	
	return time_string
