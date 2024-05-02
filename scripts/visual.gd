@tool
class_name Visual
extends GraphEdit


class f:
	extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	connect_node("Variable", 1, "Code3", 1)
	connect_node("Variable", 2, "Code3", 2)
	connect_node("Code3", 0, "Variable", 3)
	connect_node("Variable", 0, "Code4", 3)
	connect_node("Variable", 3, "Code4", 4)
	connect_node("Code4", 0, "Variable", 0)
	connect_node("Variable", 0, "Code2", 3)
	connect_node("Code2", 0, "Result", 0)
	pass
