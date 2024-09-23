shader_type canvas_item;

void vertex() {
	
}

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	// COLOR = vec4(1.0,1.0,1.0,1.0);
	// COLOR = vec4(1.0,input_color.g,input_color.b,1.0);
	float color_average = (input_color.r + input_color.g + input_color.b) / 3.0;
	vec4 output_color = vec4(color_average, color_average, color_average, input_color.a);
	if (output_color.r > 0.7 && output_color.g >0.7 && output_color.b > 0.7){
		// output_color.a = 0.0;
		output_color = vec4(1.0, 0.0,0.0,1.0);
	}
	COLOR = output_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
