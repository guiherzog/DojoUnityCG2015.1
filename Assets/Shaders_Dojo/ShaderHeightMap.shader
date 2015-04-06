Shader "Dojo_04/ShaderHeightMap" {
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
			   gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
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