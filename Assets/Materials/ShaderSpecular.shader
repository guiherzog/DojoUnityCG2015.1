﻿Shader "Dojo_Gabarito/Specular" {
   Properties {
      _Color ("Diffuse Material Color", Color) = (1,1,1,1) 
      _SpecColor ("Specular Material Color", Color) = (1,1,1,1) 
      _Shininess ("Shininess", Float) = 1
   }
   SubShader {
      Pass {	
         Tags { "LightMode" = "ForwardBase" } 
            // pass for ambient light and first light source
 
         GLSLPROGRAM
 
         // User-specified properties
         uniform vec4 _Color; 
         uniform vec4 _SpecColor; 
         uniform float _Shininess;
 
         // The following built-in uniforms (except _LightColor0) 
         // are also defined in "UnityCG.glslinc", 
         // i.e. one could #include "UnityCG.glslinc" 
         uniform vec3 _WorldSpaceCameraPos; 
            // camera position in world space
         uniform mat4 _Object2World; // model matrix
         uniform mat4 _World2Object; // inverse model matrix
         uniform vec4 _WorldSpaceLightPos0; 
            // direction to or position of light source
         uniform vec4 _LightColor0; 
            // color of light source (from "Lighting.cginc")
 
         varying vec4 position; 
            // position of the vertex in world space 
         varying vec3 varyingNormalDirection; 
            // surface normal vector in world space
 
         #ifdef VERTEX
 
         void main()
         {				
            mat4 modelMatrix = _Object2World;
            mat4 modelMatrixInverse = _World2Object; // unity_Scale.w 
               // is unnecessary because we normalize vectors
 
            position = modelMatrix * gl_Vertex;
            varyingNormalDirection = normalize(vec3(
               vec4(gl_Normal, 0.0) * modelMatrixInverse));
 
            gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
         }
 
         #endif
 
         #ifdef FRAGMENT
 
         void main()
         {
            vec3 normalDirection = normalize(varyingNormalDirection);
 
            vec3 viewDirection = 
               normalize(_WorldSpaceCameraPos - vec3(position));
            vec3 lightDirection;
            lightDirection = normalize(vec3(_WorldSpaceLightPos0));

            vec3 ambientLighting = 
               vec3(gl_LightModel.ambient) * vec3(_Color);
 
            vec3 diffuseReflection =  vec3(_LightColor0) * vec3(_Color) 
               * max(0.0, dot(normalDirection, lightDirection));
 
            vec3 specularReflection;
            if (dot(normalDirection, lightDirection) < 0.0) 
               // light source on the wrong side?
            {
               specularReflection = vec3(0.0, 0.0, 0.0); 
                  // no specular reflection
            }
            else // light source on the right side
            {
               specularReflection =  vec3(_LightColor0) 
                  * vec3(_SpecColor) * pow(max(0.0, dot(
                  reflect(-lightDirection, normalDirection), 
                  viewDirection)), _Shininess);
            }
 
            gl_FragColor = vec4(ambientLighting + diffuseReflection 
               + specularReflection, 1.0);
         }
 
         #endif
 
         ENDGLSL
      }
 
      
   } 

}