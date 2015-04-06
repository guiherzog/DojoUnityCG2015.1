Shader "Dojo_Gabarito/ShaderHeightMap" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
		sampler2dHeight ("Height Map", 2D) = "white" {}
		
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         uniform sampler2D sampler2dHeight;
         
         #ifdef VERTEX

			void main()
			{
			     position = gl_Vertex.xy;
			     vec4 color = texture2D(sampler2dHeight,position);
			     vec4 pos = gl_Vertex;
			     float scale = 0.1;
			     pos.y +=  color.x*scale;
			   gl_Position = gl_ModelViewProjectionMatrix * pos;
			}
         #endif
         #ifdef FRAGMENT
			void main(){
				gl_FragColor = texture2D(sampler2dTexture, position);
			}
         #endif
         ENDGLSL 
      }
   }
}