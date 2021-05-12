#version 120

uniform sampler2D colortex4;
uniform sampler2D normals;

varying vec2 texcoord;

void main() {
	vec3 normal = texture2D(normals, texcoord.xy).rgb;
	float fuck = 1.0f - dot(normalize(normal.yxy), normalize(normal.xyx));
	vec3 heat = texture2D(colortex4, vec2(fuck*3.0f, 0.5f)).rgb;

/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(heat, 1.0f);
}
