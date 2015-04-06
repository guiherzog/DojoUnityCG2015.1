Shader "Dojo_Gabarito/ShaderVertexTexture" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         varying vec4 vertexColor;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
				position = gl_Vertex.xy;
				vertexColor = texture2D(sampler2dTexture, position);
			}
         #endif
         #ifdef FRAGMENT
			void main(){
				gl_FragColor = vertexColor;
			}
         #endif
         ENDGLSL 
      }
   }
}