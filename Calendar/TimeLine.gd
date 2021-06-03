tool
extends HBoxContainer


var line
var _time


func init(time: String, thickness: int, width: int, color: Color):
	line = $VBoxContainer/ColorRect
	line.color = color
	line.rect_min_size = Vector2(width, thickness)
	
	var label = $Label
	label.text = time
	label.set("custom_colors/font_color", color)
	
	if time != "":
		_time = time


func _on_resize(new_size):
	line.rect_min_size.x = new_size.x - 55 # 55 is the time text width + spacing
	if _time:
		TimeLineLocs.locs[_time] = rect_global_position.y
