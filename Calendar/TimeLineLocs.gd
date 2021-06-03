extends Node


var locs = {}


func _ready():
	# SENDS NOTIFICATIONS, BUT SUCKS LOL use this: https://github.com/ninest/aquaui/blob/master/docs/3-notification.md
#	OS.execute("osascript", ["-e", 'display notification "Today at 4 PM" with title "Organizer" subtitle "Event"'], false)
	
	OS.min_window_size = Vector2(900, 650)
	OS.low_processor_usage_mode = true
	OS.keep_screen_on = false
	OS.center_window() 
	
#	OS.alert("This will pause the thread")
