extends Control


const TRUE_MIN_SIZE = Vector2(100, 1080)

func _ready():
	rect_min_size = TRUE_MIN_SIZE


#func _on_resize(new_size):
#	pass
#	new_size = (new_size.x - 132) / 7
#	if new_size > 100:
#		rect_min_size.x = new_size
	# 132 = 22 * 6 (size of divider lines * num dividers)
