Shader "Custom/BasicDiffuse" {
	Properties {
		_RampTex ("_RampTex", 2D) = "white" {}
		_EmissiveColor ("Emissive Color", Color) = (1, 1, 1, 1)
		_AmbientColor ("Ambient Color", Color) = (1, 1, 1, 1)
		_MySliederValue ("A slider", Range(0, 10)) = 2.5
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf ColorRectHalfLambert

		sampler2D _RampTex;
		float4 _EmissiveColor;
		float4 _AmbientColor;
		float _MySliederValue;

		inline float4 LightingBasicDiffuse (SurfaceOutput s, fixed3 lightDir, fixed atten) {
			float difLight = max(0, dot(s.Normal, lightDir));
			
			float4 col;
			col.rgb = s.Albedo * _LightColor0.rgb * (difLight * atten * 2);
			col.a = s.Alpha;
			return col;
		}
		
		inline float4 LightingHalfLambert (SurfaceOutput s, fixed3 lightDir, fixed atten) {
			float difLight = max(0, dot(s.Normal, lightDir));
			float hLambert = 0.5 * difLight + 0.5;
			
			float4 col;
			col.rgb = s.Albedo * _LightColor0.rgb * (hLambert * atten * 2);
			col.a = s.Alpha;
			return col;
		}
		
		inline float4 LightingRampHalfLambert (SurfaceOutput s, fixed3 lightDir, fixed atten) {
			float difLight = max(0, dot(s.Normal, lightDir));
			float hLambert = 0.5 * difLight + 0.5;
			float3 ramp = tex2D(_RampTex, float2(hLambert, hLambert)).rgb;
			
			float4 col;
			col.rgb = s.Albedo * _LightColor0.rgb * ramp;
			col.a = s.Alpha;
			return col;
		}
		
		inline float4 LightingColorRectHalfLambert (SurfaceOutput s, fixed3 lightDir, half3 viewDir, fixed atten) {
			float difLight = max(0, dot(s.Normal, lightDir));
			float rimLight = max(0, dot(s.Normal, viewDir));
			float hLambert = 0.5 * difLight + 0.5;
			float3 ramp = tex2D(_RampTex, float2(hLambert, rimLight)).rgb;
			
			float4 col;
			col.rgb = s.Albedo * _LightColor0.rgb * ramp;
			col.a = s.Alpha;
			return col;
		}
		
		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = pow(_EmissiveColor + _AmbientColor, _MySliederValue);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
} 
