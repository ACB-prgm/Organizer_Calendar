extends HBoxContainer


var children

func _ready():
	#osascript -e 'say "Hello World!"'
	
	children = get_children()
	children.remove(0) #remove the space
	for child in children:
		if child is VSeparator:
			children.erase(child)


func _on_PanelContainer2__resize(new_size):
	new_size = (new_size.x - 132) / 7
	if new_size > 100:
		for child in children:
			child.rect_min_size.x = new_size
# 132 = 22 * 6 (size of divider lines * num dividers)
