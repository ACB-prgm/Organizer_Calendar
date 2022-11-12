extends Node

var selected_date := Date.new()
var TimeLinelocs = {}
var event_info := {}
var calendar_settings := {}
signal its_fucked

func _ready():
#	var PID = OS.execute("osascript", ["-e", 'display notification "Today at 4 PM" with title "Organizer" subtitle "Event"'], false)
#	^ SENDS NOTIFICATIONS, BUT SUCKS LOL use this: https://github.com/ninest/aquaui/blob/master/docs/3-notification.md
#	OS.alert("This will pause the thread")

	OS.min_window_size = Vector2(900, 650)
	OS.low_processor_usage_mode = true
	OS.keep_screen_on = false
	OS.center_window() 
	
	if !load_data():
		save_data()


# SAVE/LOAD
const DIR = "user://calendar_info/"

var save_path = DIR + 'data.dat'


func save_data() -> void:
	var dir = Directory.new()
	if !dir.dir_exists(DIR):
		dir.make_dir_recursive(DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, 'abigail')
	if error == OK:
		var data = {
			"event_info" : event_info,
			"calendar_settings" : calendar_settings,
		}
		
		file.store_var(data)
		file.close()

func load_data() -> bool:
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, 'abigail')
		if error == OK:
			var data = file.get_var()
			
			event_info = data.get("event_info")
			calendar_settings = data.get("calendar_settings")
			
			file.close()
			return true
		else:
			return false
	else:
			return false
