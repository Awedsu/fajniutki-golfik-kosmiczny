shader_type canvas_item;

void fragment() {
	vec2 scroll_uv = UV;
	scroll_uv.x -= TIME * 0.5; 
	COLOR = texture(TEXTURE, scroll_uv);
}