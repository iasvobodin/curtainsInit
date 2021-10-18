precision highp float;
#define PI_2 6.283185307179586
float exponentialOut(float t) {
    return t == 1.0 ? t : 1.0 - pow(2.0, -10.0 * t);
}
attribute vec3 position;
attribute vec2 uv;
varying vec2 vUv;
varying float vAlpha;
uniform float opacity;
uniform float progress;
uniform vec3 offset;
uniform vec4 time;
uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 cameraPosition;
void main(void) {
    vUv = uv;
    vec3 posSway = position;
    vec3 wave = offset;
    wave.y += sin(time.y * 0.2 + uv.x * 2.0 * PI_2 + uv.y * 4.0 * PI_2) * 15.0;
    posSway += wave;
    vec2 d = sin(vUv * vec2(1.0, 2.0) * PI_2) * 0.25 + 0.25;
    float s = smoothstep(0.0, 1.0, progress - d.x - d.y);
    vec3 pos = mix(position, posSway, s);
    vAlpha = exponentialOut(1.0 - s) * opacity;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}