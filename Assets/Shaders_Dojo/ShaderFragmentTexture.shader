Shader "Dojo_04/ShaderFragmentTexture" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
				position = gl_Vertex.xy;
				 
			}
         #endif
         #ifdef FRAGMENT
			void main(){
			}
         #endif
         ENDGLSL 
      }
   }
}
