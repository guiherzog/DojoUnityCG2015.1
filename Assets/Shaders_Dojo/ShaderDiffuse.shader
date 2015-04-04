Shader "Dojo03/Diffuse" {
   Properties {
      _Color ("Diffuse Material Color", Color) = (1,1,1,1) 
   }
   SubShader {
      Pass {	
         Tags { "LightMode" = "ForwardBase" } 
         GLSLPROGRAM
         uniform vec4 _Color; 
         uniform mat4 _Object2World; // model matrix
         uniform mat4 _World2Object; // inverse model matrix
         uniform vec4 _WorldSpaceLightPos0; // direction to or position of light source
         uniform vec4 _LightColor0; // color of light source 
         varying vec4 color; // the diffuse lighting computed in the vertex shader
 
         #ifdef VERTEX
         void main()
         {				
            mat4 modelMatrix = _Object2World;
            mat4 modelMatrixInverse = _World2Object;
            
            // Codigo Aqui
            vec3 modelNormalized = normalize(gl_Normal);
            vec4 lightNormalized = normalize(_WorldSpaceLightPos0);
            
            float diffuseContribution = dot(modelNormalized, lightNormalized.xyz);
            
            color = _Color * diffuseContribution;
            color.a = 1.0;
            // Posicionamento do vertice na tela
            gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
         }
 
         #endif
 
         #ifdef FRAGMENT
 
         void main()
         {
            gl_FragColor = color;
         }
 
         #endif
 
         ENDGLSL
      }
   } 
}