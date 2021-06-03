extends PanelContainer

const NUM_H_LINES = 96
const NUM_V_LINES = 6
const TIME_TEXT_MINSIZE = Vector2(50, 22)

export var COLOR = Color(0.6, 0.6, 0.6, 1)

var line_tscn = preload("res://Calendar/TimeLine.tscn")

signal _resize(new_size)


func _ready():
# warning-ignore:return_value_discarded
	get_tree().root.connect("size_changed", self, "_on_PanelContainer2_resized")  #Eventually, this will need to be replaced by 
	# something upstream.  This window will be placed inside another container, and we want to change when THAT is resized.
	for child in $HBoxContainer.get_children():
		if child.has_method("_on_resize"):
# warning-ignore:return_value_discarded
			connect("_resize", child, "_on_resize")
	draw_H_lines()
	
	refresh_sizing() # ensures 


func draw_H_lines():
	var length = rect_size.x
	var thickness : int
	var text: String
	var color : Color
	var count := 0
	
	for x in range(NUM_H_LINES):
		var line = line_tscn.instance()
		color = COLOR
		
		if x == 0 or x % 4 == 0:  # if making an Hour bar
			thickness = 2
			count += 1

			if count == 1:
				text = "12 AM"
			elif count < 13:
				text = "%s AM" % str(count-1)
			elif count == 13:
				text = "%s PM" % str(count -1)
			else:
				text = "%s PM" % str(count - 13)
		else:
			thickness = 1
			text = ""
			color.a = 0.5
		
# warning-ignore:return_value_discarded
		connect("_resize", line, "_on_resize")
		line.init(text, thickness, length, color)
		$VBoxContainer.add_child(line)
	
	var space = Control.new()
	space.rect_min_size.y = 10
	$VBoxContainer.add_child(space)


func refresh_sizing():
	var viewport_size = get_viewport().size
	rect_size = viewport_size
	$HBoxContainer.rect_size.x = viewport_size.x
	$VBoxContainer.set("custom_constants/separation", lerp(0.0, 20.0, viewport_size.y/1400.0)) # works OK, but could be better
	emit_signal("_resize", viewport_size)


func _on_PanelContainer2_resized():
	refresh_sizing()
