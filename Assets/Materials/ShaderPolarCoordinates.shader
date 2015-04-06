Shader "Dojo_Gabarito/ShaderPolarCoordiantes" {
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
			vec2 positionToTextureOnSphere(vec3 position)
			{
				vec2 textCoord;
			  	float pi = 3.14159265358979323846264;

			  	textCoord.x = atan(position.x,position.z);
			  	textCoord.y = asin(float(position.y))/2*pi;
				return textCoord;
			}
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
