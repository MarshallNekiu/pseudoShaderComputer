extends AudioStreamPlayer3D


var label: Label
var shader: ShaderMaterial
var shader3d: ShaderMaterial
var viewport: ViewportTexture
var phase := 0.0
var hz := 0.0
var increment := hz / rate
var rate := 44100.0
var time := 0.0
var offset := 0.0


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if not event.is_released(): return
		hz = [32.7032, 65, 110, 220, 440, 660, 880, 1000].pick_random()
		increment = hz / rate


func _ready() -> void:
	await get_tree().root.get_child(0).ready
	shader.set_shader_parameter("wave", Vector3(phase, hz, rate))
	shader.set_shader_parameter("time", time)
	shader.set_shader_parameter("offset", offset)


func _process(delta: float) -> void:
	var playback := get_stream_playback() as AudioStreamGeneratorPlayback
	var image := viewport.get_image()
	var buffer: PackedVector2Array
	while playback.can_push_buffer(buffer.size() + 1):
		var frame = (image.get_pixel(fmod(buffer.size(), 100), fmod(floori((buffer.size()) * 0.01), 100)))
		buffer.append(Vector2.ONE * (frame.r - frame.g))
	playback.push_buffer(buffer)
	
	phase = fmod(phase + increment * buffer.size(), 1.0)
	time = fmod(time + delta, 6)
	offset = (offset + buffer.size())
	shader.set_shader_parameter("wave", Vector3(phase, hz, rate))
	shader.set_shader_parameter("time", time)
	shader.set_shader_parameter("offset", offset)
	shader3d.set_shader_parameter("wave", Vector3(phase, hz, rate))
	shader3d.set_shader_parameter("time", time)
	shader3d.set_shader_parameter("offset", offset)
	label.text = str(time, "\n", hz, "\n", delta, "\n", buffer.size(), "\n", offset)
	
