Shader "Dojo_04/ShaderNormalMap" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         uniform vec4 _WorldSpaceLightPos0;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
				position = gl_Vertex.xy;
			}
         #endif
         #ifdef FRAGMENT
			void main(){
				vec4 textura = texture2D(sampler2dTexture, position);


			    

			}
         #endif
         ENDGLSL 
      }
   }
}