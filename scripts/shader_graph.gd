extends Node2D

@onready var shader := ($SubViewportContainer/SubViewport/Output as ColorRect).material as ShaderMaterial
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


var test := 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var image := tex.get_image()
	var color := {image.get_pixel(0, 0): image.get_pixel(1, 0)}
	var color2 := {image.get_pixel(2, 0): image.get_pixel(3, 0)}
	var value := color_to_int(color)
	var value2 := color_to_int(color2)
	label.text = str(color, "\n", value, "\n",color2, "\n", value2, "\n", delta)
	shader.set_shader_parameter("integer", [int(test) * 10000, -int(test) * 1000000])
	test += 1


@onready var tex := ($SubViewportContainer/SubViewport as SubViewport).get_texture() as ViewportTexture
@onready var label := $GraphEdit/Output/Label as Label


func color_to_int(color: Dictionary) -> int:
	var r := 0
	for i in color:
		var xyz_e6 := color[i] as Color
		var type_yz_e10 := (i as Color)
		var type := int(type_yz_e10.r)
		r += round(xyz_e6.b * 100) * 1
		r += round(xyz_e6.g * 100) * 100
		r += round(xyz_e6.r * 100) * 1e4
		r += round(type_yz_e10.b * 100) * 1e6
		r += round(type_yz_e10.g * 100) * 1e8
		r = r if type == 0 else -r
	return r
