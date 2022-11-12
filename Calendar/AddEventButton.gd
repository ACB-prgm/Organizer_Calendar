extends Button


const NORMAL_COLOR = Color(0.2, 0.2, 0.2, 1.0)
const HOVER_COLOR = Color(0.6, 0.6, 0.6, 1.0)


func _on_AddEventButton_mouse_entered():
	set_modulate(HOVER_COLOR)


func _on_AddEventButton_mouse_exited():
	set_modulate(NORMAL_COLOR)
