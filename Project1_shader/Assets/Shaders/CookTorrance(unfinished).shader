Shader "Custom/CookTorrance" {
	Properties {
		_MainTint ("Diffuse Tint", Color) = (1, 1, 1, 1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_RoughnessTex ("Roughness texture", 2D) = "" {}
		_Roughness ("Roughness", Range(0, 1)) = 0.5
		_SpecularColor ("Specular Tint", Color) = (1, 1, 1, 1)
		_SpecPower ("Specular Power", Range(0, 30)) = 2
		_Fresnel ("Fresnel Value", Range(0, 1.0)) = 0.05
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _RoughnessTex;
		float _Roughness;
		float _Fresnel;
		float _SpecPower;
		float4 _MainTint;
		float4 _SpecularColor;
		
		/*inline fixed4 LightingMetallicSoft (SurfaceOutput s, fixed3 lightDir, half3 viewDir, fixed atten) {
				float3 halfVector = normalize(lightDir + viewDir);
				float NdotL = saturate(dot(s.Normal, normalize(lightDir)));
				float NdotH_raw = dot(s.Normal, halfVector);
				float NdotH = saturate(dot(s.Normal, halfVector));
				float NdotV = saturate(dot(s.Normal, normalize(viewDir)));
				float VdotH = saturate(dot(viewDir, normalize(halfVector)));
				
				float geoEnum = 2.0 * NdotH;
				float G1 = (geoEnum * NdotV) / NdotH;
				float G2 = (geoEnum * NdotL) / NdotH;
				
		}*/

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
