shader_type spatial;

varying vec3 vtx;
uniform vec3 wave = vec3(0, 440, 44100);
uniform float time = 1.0;
uniform float offset = 0.0;

float fmod(float x, float y){
	return fract(x / y);
}

float amplitude(float phase){
	float res;
	res = (wave.y > 600.0 ? 0.5 : 1.0) * (wave.y < 200.0 ? 3.0 : 1.0) * 
	sin(phase * TAU) * 1.0 * exp(-time * time) * 5.0 + sin(phase * TAU) * abs(sin(time * 5.0));
	return sin(phase * TAU);
}

void vertex() {
	float frame = offset + (VERTEX.x * 100.0) + (VERTEX.z * 1.0);
	float phase = fmod(wave.y / wave.z * frame, 1.0);
	vtx.y = amplitude(phase);
	vtx.y = sin(length(vec2(VERTEX.x, vtx.y) * 0.2));
	float y = vtx.y > 0.0 ? vtx.y * 1.0 : vtx.y;
	y = sin(y);
	VERTEX *= vec3(0.5, y, y);
}

void fragment() {
	ALBEDO.r = vtx.y >= 0.0 ? vtx.y : 0.0;
	ALBEDO.g = vtx.y < 0.0 ? vtx.y : 0.0;
	ALBEDO.b = sin((UV.x + 0.0) * PI) * cos((UV.y + 0.5) * PI);
}

//void light() {}
