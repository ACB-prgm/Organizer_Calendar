extends PanelContainer

const NUM_H_LINES = 96
const NUM_V_LINES = 6
const TIME_TEXT_MINSIZE = Vector2(50, 22)

export var COLOR = Color(0.6, 0.6, 0.6, 1)

var HourLineStyle = preload("res://Calendar/CustomStyles/Lines/HLines_Hour.tres")
var QuarterLineStyle = preload("res://Calendar/CustomStyles/Lines/HLines_Quarters.tres")
var line_tscn = preload("res://Calendar/TimeLine.tscn")

signal _resize(new_size)


func _ready():
# warning-ignore:return_value_discarded
	get_tree().root.connect("size_changed", self, "_on_PanelContainer2_resized")  #Eventually, this will need to be replaced by 
	# something upstream.  This window will be placed inside another container, and we want to change when THAT is resized.
	draw_H_lines()
	
	refresh_sizing() # ensures 


func draw_H_lines():
	var line_style
	var minutes : int
	var color : Color
	
	for x in range(NUM_H_LINES):
		var line = line_tscn.instance()
		
		color = COLOR
		minutes = x * 15
		
		if x == 0 or x % 4 == 0:  # if making an Hour bar
			line_style = HourLineStyle
		else:
			line_style = QuarterLineStyle
			color.a = 0.5
		
		line.init(minutes, line_style, color)
# warning-ignore:return_value_discarded
		connect("_resize", line, "_on_resize")
		$VBoxContainer.add_child(line)
	
	var space = Control.new()
	space.rect_min_size.y = 10
	$VBoxContainer.add_child(space)


func refresh_sizing():
	var viewport_size = get_viewport().size
	rect_size = viewport_size
	$VBoxContainer.set("custom_constants/separation", lerp(0.0, 20.0, viewport_size.y/1400.0)) # works OK, but could be better
	emit_signal("_resize", viewport_size)


func _on_PanelContainer2_resized():
	refresh_sizing()
