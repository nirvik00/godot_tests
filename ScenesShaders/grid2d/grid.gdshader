shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// vec2 uvresize = UV * 5.0;
	vec2 uvresize = fract(UV * 5.0);
	//COLOR = vec4(uvresize,0.0,1.0);
	COLOR = texture(TEXTURE, uvresize);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
