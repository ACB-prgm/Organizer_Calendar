extends Control


export (String, 
	"MON", 
	"TUES", 
	"WEDS", 
	"THURS", 
	"FRI", 
	"SAT", 
	"SUN"
	) var weekday


#func _on_resize(new_size):
#	pass
#	new_size = (new_size.x - 132) / 7
#	if new_size > 100:
#		rect_min_size.x = new_size
	# 132 = 22 * 6 (size of divider lines * num dividers)
