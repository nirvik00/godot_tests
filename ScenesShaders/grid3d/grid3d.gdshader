shader_type spatial;
uniform sampler2D tex;

void vertex() {
	
}

void fragment() {
	vec2 resuv = UV*2.0;
	ALBEDO = vec3(resuv, 0.0);
	ALBEDO = texture(tex, resuv).rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
