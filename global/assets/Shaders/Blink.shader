shader_type canvas_item;
render_mode unshaded;

//uniform float intensity : 0.0;
//uniform float fuzziness : 0.0;

void fragment(){
	//vec4 col = texture(TEXTURE, UV);
	//COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	//float alpha = -4.0 * col.a;
	//alpha += texture(TEXTURE, UV + vec2(0.1, 0.0)).a;
	//COLOR = vec4(col.rgb, alpha);
	
	COLOR = COLOR * texture(TEXTURE, UV) * float(int(TIME)%2);
}