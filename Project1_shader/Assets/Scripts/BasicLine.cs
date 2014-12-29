using UnityEngine;
using System.Collections;
using Vectrosity;

public class BasicLine : MonoBehaviour {

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
        VectorLine v1 = VectorLine.SetLine(Color.green, new Vector2(0, 0), new Vector2(Screen.width - 1, Screen.height - 1));
	}
}
