import './style.css'
import {Curtains, Plane} from "curtainsjs";
import fragment from './static/init.frag?raw'
import vertex from './static/init.vert?raw'

// wait for everything to be ready
window.addEventListener("load", () => {
// set up our WebGL context and append the canvas to our wrapper
const curtains = new Curtains({
container: "canvas"
});
// get our plane element
const planeElement = document.getElementsByClassName("plane")[0];
// set our initial parameters (basic uniforms)
const params = {
vertexShader: vertex, // our vertex shader ID
fragmentShader: fragment,
fov: 210, // our fragment shader ID
uniforms: {
time: {
name: "uTime", // uniform name that will be passed to our shaders
type: "1f", // this means our uniform is a float
value: 0,
},
},
};
// create our plane using our curtains object, the HTML element and the parameters
const plane = new Plane(curtains, planeElement, params);
plane.onRender(() => {
// use the onRender method of our plane fired at each requestAnimationFrame call
plane.uniforms.time.value++; // update our time uniform value
});
});