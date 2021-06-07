extends VBoxContainer

var calendar := Calendar.new()
var selected_date := Date.new()



func _ready():
	yield(get_tree().create_timer(0.01), "timeout")
	
	var test = load("res://Calendar/CalendarWeekEvent/CalendarWeekEvent.tscn").instance()
	test.create_event_info([3, 15, "AM"])
	$ScrollContainer/PanelContainer2/HBoxContainer/CalendarEventColumn.add_child(test)
