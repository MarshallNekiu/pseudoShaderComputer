@tool
extends CharacterBody3D


func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		rotation = Vector3(event.position.x, event.position.y, event.position.y) * 0.01
