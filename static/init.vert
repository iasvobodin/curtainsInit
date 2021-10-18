precision highp float;
#define PI_2 6.283185307179586
float exponentialOut(float t) {
    return t == 1.0 ? t : 1.0 - pow(2.0, -10.0 * t);
}
  // those are the mandatory attributes that the lib sets
  attribute vec3 aVertexPosition;
  attribute vec2 aTextureCoord;
  // those are mandatory uniforms that the lib sets and that contain our model view and projection matrix
  uniform mat4 uMVMatrix;
  uniform mat4 uPMatrix;
  // our texture matrix that will handle image cover
  uniform mat4 uTextureMatrix0;
  // pass your vertex and texture coords to the fragment shader
  varying vec3 vVertexPosition;
  varying vec2 vTextureCoord;
  varying float vAlpha;

void main(void) {
  vec3 position = aVertexPosition;
    vec2 uv = aTextureCoord;
    vec2 vUv = uv;
    vec3 posSway = position;
    vec3 wave = vec3(80.0, -40.0, 10.0);
    wave.y += sin(59.4703 * 0.2 + uv.x * 2.0 * PI_2 + uv.y * 4.0 * PI_2) * 15.0;
    posSway += wave;
    vec2 d = sin(vUv * vec2(1.0, 2.0) * PI_2) * 0.25 + 0.25;
    float s = smoothstep(0.0, 1.0, .0 - d.x - d.y);
    vec3 pos = mix(position, posSway, s);
    vAlpha = exponentialOut(1.0 - s) * 1.;
    gl_Position = uPMatrix * uMVMatrix * vec4(pos, 1.0);
    //   vTextureCoord = (uTextureMatrix0 * vec4(aTextureCoord, 0.0, 1.0)).xy;
//   vVertexPosition = vertexPosition;
}


//   void main() {
//   vec3 vertexPosition = aVertexPosition;



//   gl_Position = uPMatrix * uMVMatrix * vec4(vertexPosition, 1.0);
//   // set the varyings
//   // here we use our texture matrix to calculate the accurate texture coords
//   vTextureCoord = (uTextureMatrix0 * vec4(aTextureCoord, 0.0, 1.0)).xy;
//   vVertexPosition = vertexPosition;
//   }