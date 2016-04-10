/* tld glsl shader -- vs_swy_tld_hp_overlay -- by swyter */
#version 120

attribute vec3 inPosition;
attribute vec3 inNormal;
attribute vec4 inColor0;
attribute vec4 inColor1;
attribute vec2 inTexCoord;

uniform mat4 matWorldViewProj;
uniform mat4 matWorldView;
uniform mat4 matWorld;

/* swyter-- used to hide the HP overlay on TLD cutscenes */
uniform float swy_ui_opacity = 1.0f;

varying vec4 outColor0;
varying vec2 outTexCoord;
varying float outFog;

uniform vec4 vMaterialColor;

void main()
{
	gl_Position = matWorldViewProj * vec4(inPosition, 1.0);
	vec4 vWorldPos = matWorld * vec4(inPosition, 1.0);

	outColor0 = inColor0.bgra * vMaterialColor * swy_ui_opacity;
	outTexCoord = inTexCoord;
	outFog = 1.f;
}

