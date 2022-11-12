class_name CalendarEventInfo


var title : String
var start_time : Array
var end_time : Array
var priority : int
var date : Array
var notes : String
var reminders : Array


func _init(_title : String = "null",
		_start_time : Array = [6, 0, "AM"], 
		_end_time : Array = [7, 0, "AM"], 
		_priority : int = 4, 
		_date : Array = [OS.get_date()["day"], OS.get_date()["month"], OS.get_date()["year"]],
		_notes : String  = "",
		_reminders : Array = []
		):
	
	self.start_time = _start_time 
	self.end_time = _end_time
	self.priority = _priority
	self.date = _date
	self.notes = _notes
	self.reminders = _reminders
