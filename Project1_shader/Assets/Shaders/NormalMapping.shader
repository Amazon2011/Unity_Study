Shader "Custom/NormalMapping" {
	Properties {
		_MainTint ("Main Color", Color) = (1, 1, 1, 1)
		_NormalTex ("Normal Tex", 2D) = "white" {}
		_NormalIntensity("Normal Map Intensity", Range(0, 2)) = 1 
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		float4 _MainTint;
		sampler2D _NormalTex;
		float _NormalIntensity;

		struct Input {
			float2 uv_NormalTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			float3 normalMap = UnpackNormal(tex2D (_NormalTex, IN.uv_NormalTex));
			
			o.Normal = float3(normalMap.x * _NormalIntensity, normalMap.y * _NormalIntensity, normalMap.z);
			o.Albedo = _MainTint.rgb;
			o.Alpha = _MainTint.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
