Shader "Dojo_Gabarito/ShaderNormalMap" {
	Properties {
		sampler2dTexture ("Texture", 2D) = "white" {}
		sampler2dNormal ("Normal Map", 2D) = "white" {}
	}
   SubShader { 
      Pass { 
         GLSLPROGRAM 
         varying vec2 position;
         uniform sampler2D sampler2dTexture;
         uniform vec4 _WorldSpaceLightPos0; 
         uniform sampler2D sampler2dNormal;
         #ifdef VERTEX
			void main(){ 
				gl_Position = ftransform();
				position = gl_Vertex.xy;
			}
         #endif
         #ifdef FRAGMENT
			void main(){
				float indice_ambiente = 0.5;
				float indice_difusa = 0.5;
				vec4 textura = texture2D(sampler2dTexture, position);
				vec3 mapa_normal = texture2D(sampler2dNormal, position).xyz;

				vec3 luz_dir = vec3(_WorldSpaceLightPos0);
				float cos_theta = dot(normalize(mapa_normal) ,	normalize(luz_dir));
				if (cos_theta < 0.0)
					cos_theta = 0.0;
			    
				textura.rgb = indice_difusa*textura.rgb*cos_theta + textura.rgb*indice_ambiente;
				gl_FragColor = textura;

			}
         #endif
         ENDGLSL 
      }
   }
}