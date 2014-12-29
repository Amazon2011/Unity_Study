using UnityEngine;
using System.Collections;

public class ProceduralTexture : MonoBehaviour
{
    #region Public Variables
    public int widthHeight = 512;
    public Texture2D generatedTexture;
    #endregion

    #region Private Variables
    private Material currentMaterial;
    private Vector2 centerPosition;
    #endregion

    // Use this for initialization
	void Start () {
        if (!currentMaterial)
        {
            currentMaterial = renderer.material;
            if (!currentMaterial)
            {
                Debug.Log("Can not find a material");
            }
        }

        if (currentMaterial)
        {
            centerPosition = new Vector2(0.5f, 0.5f);
            generatedTexture = GenerateParabola();

            currentMaterial.SetTexture("_MainTex", generatedTexture);
        }

	}

    private Texture2D GenerateParabola()
    {
        Texture2D proceduralTex = new Texture2D(widthHeight, widthHeight);

        Vector2 centerPixelPosition = centerPosition * widthHeight;

        for (int x = 0; x <= widthHeight; x++)
        {
            for (int y = 0; y <= widthHeight; y++)
            {
                Vector2 currentPosition = new Vector2(x, y);

                float pixelDistance = Vector2.Distance(currentPosition, centerPixelPosition) / (widthHeight * 0.5f);

                pixelDistance = Mathf.Abs(1 - Mathf.Clamp(pixelDistance, 0f, 1f));

                //sin
                pixelDistance = Mathf.Sin(pixelDistance * 200) * pixelDistance;

                Color pixelColor = new Color(pixelDistance, pixelDistance, pixelDistance, 1.0f);
                proceduralTex.SetPixel(x, y, pixelColor);
            }
        }

        proceduralTex.Apply();

        return proceduralTex;
    }
}
