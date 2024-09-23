shader_type spatial;

// render_mode unshaded;
render_mode diffuse_toon, specular_toon;

void vertex() {
	NORMAL = normalize(vec3(k - height(pos + vec2(0.1, 0.0), TIME), 0.1, k - height(pos + vec2(0.0, 0.1), TIME)));
  vec2 pos = VERTEX.xz;
  float k = height(pos, TIME);
  VERTEX.y = k;
}

void fragment() {
	RIM = 0.2;
	METALLIC = 0.0;
	ROUGHNESS = 0.01;
	ALBEDO = vec3(0.1, 0.3, 0.5);
}

float height(vec2 position, float time) {
	vec2 offset = 0.01 * cos(position + time);
	return texture(noise, (position / 10.0) - offset).x;
}
//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
