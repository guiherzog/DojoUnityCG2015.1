Shader "Dojo_04/ShaderVertexTexture" {
	Properties {
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
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