shader_type canvas_item;

uniform vec3 wave = vec3(0, 440, 44100);
uniform float time = 1.0;
uniform float offset = 0.0;

float fmod(float x, float y){
	return fract(x / y);
}

void vertex() {
}

void fragment() {
	float frame = offset + (FRAGCOORD.x + 0.0) + (FRAGCOORD.y * 100.0 + 0.0);
	float phase = fmod(wave.y / wave.z * frame, 1.0);
	float y = (wave.y > 600.0 ? 0.5 : 1.0) * (wave.y < 200.0 ? 3.0 : 1.0) 
			* sin(phase * TAU) * 1.0 * exp(-time * time) * 5.0 + sin(phase * TAU) * abs(sin(time * 5.0));
	y = sin(phase * TAU) * (wave.y < 60.0 ? 10.0 : 1.0);
	COLOR.rbg = vec3(y > 0.0 ? y : 0.0, y == 0.0 ? 1.0 : 0.0, y < 0.0 ? -y : 0.0);
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
