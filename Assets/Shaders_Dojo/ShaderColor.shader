Shader "Dojo03/Color" {
   SubShader {
      Pass { 
         GLSLPROGRAM 
         #ifdef VERTEX
         void main() 
         {
            gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
         }
         #endif 
 
         #ifdef FRAGMENT
         void main()
         {
           vec4 corVermelha = vec4(1.0, 0.0, 0.0, 1.0);
           gl_FragColor = corVermelha;
         }
         #endif
         ENDGLSL 
      }
   }
}