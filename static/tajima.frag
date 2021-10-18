precision highp float;
varying vec2 vUv;
varying float vAlpha;
uniform sampler2D texture;
void main(void) {
    vec4 rgba = texture2D(texture, vUv);
    rgba.a *= vAlpha;
    gl_FragColor = rgba;
}
