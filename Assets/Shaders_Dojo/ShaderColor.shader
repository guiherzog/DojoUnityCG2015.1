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
           // Codigo Aqui.
         }
         #endif
         ENDGLSL 
      }
   }
}