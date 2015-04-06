Shader "Dojo_04/ShaderPolarCoordiantes" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec3 position;
         uniform sampler2D sampler2dTexture;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
				position = gl_Vertex.xyz;
				 
			}
         #endif
         #ifdef FRAGMENT

			void main(){
			  vec2 textCoord = positionToTextureOnSphere(position);
			  vec4 color = texture2D(sampler2dTexture,textCoord);
			  gl_FragColor = color;
			}
         #endif
         ENDGLSL 
      }
   }
}
