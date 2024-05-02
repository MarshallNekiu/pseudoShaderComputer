class_name SlotVar
extends Button


class Float:
	extends Button


var ports := Vector2(false, false)


func _init() -> void:
	var c = "d"
	c = 5
	OS.alert(str(c))
	toggle_mode = true
	button_down.connect(_on_button_down)


func _on_button_down() -> void:
	if is_pressed(): queue_free()
	await get_tree().create_timer(0.5).timeout
	button_pressed = false
