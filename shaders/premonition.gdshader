shader_type canvas_item;
uniform vec2 center;
uniform float force;

void vertex() {
	VERTEX.y += 12.0 * sin(400.0*UV.x + TIME*2.0);
	VERTEX.x += 10.0 * cos(300.0*UV.y + TIME*2.0);
}
void fragment(){
	vec2 disp = normalize(UV - center) * force;
	COLOR = texture(TEXTURE,UV-disp);
}

