Shader "Custom/WaterFlow" {
	Properties {
		_MainTint ("Diffuse Tint", Color) = (1, 1, 1, 1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_XScrollSpeed ("X Flow Speed", Range(0, 10)) = 2
		_YScrollSpeed ("Y Flow Speed", Range(0, 10)) = 2
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		fixed4 _MainTint;
		sampler2D _MainTex;
		fixed _XScrollSpeed;
		fixed _YScrollSpeed;
		

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed2 scrolledUV = IN.uv_MainTex;
			
			fixed xScrollValue = _XScrollSpeed * _Time;
			fixed yScrollValue = _YScrollSpeed * _Time;
			
			scrolledUV += fixed2(xScrollValue, yScrollValue);
		
			half4 c = tex2D (_MainTex, scrolledUV);
			o.Albedo = c.rgb * _MainTint.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
