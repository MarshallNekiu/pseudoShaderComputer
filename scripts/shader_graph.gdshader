shader_type canvas_item;

uniform int[50] integer;

vec3[2] int_to_vec3(int n){
	vec3 r;
	vec3 r2;
	r.x = n >= 0 ? 0.0 : 1.0;
	n = abs(n);
	while (n >= int(1e8)){
		r.y += 0.01;
		n -= int(1e8);
	}
	while (n >= int(1e6)){
		r.z += 0.01;
		n -= int(1e6);
	}
	while (n >= int(1e4)){
		r2.x += 0.01;
		n -= int(1e4);
	}
	while (n >= 100){
		r2.y += 0.01;
		n -= 100;
	}
	while (n >= 1){
		r2.z += 0.01;
		n -= 1;
	}
	return {r, r2};
}

void fragment() {
	vec2 st = FRAGCOORD.xy / (1.0/SCREEN_PIXEL_SIZE);
    float pixel = (st.x + st.y * 100.0) - 0.5;
	int index = int(pixel * 100.0);
	if (index < 10){
		vec3[2] color = int_to_vec3(integer[index / 2]);
		int type = index % 2 == 0 ? 0 : 1;
		COLOR.rgb = color[type];
	}
}
