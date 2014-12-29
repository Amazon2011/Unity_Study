using UnityEngine;
using System.Collections;

public class MoveScript : MonoBehaviour {
    public Vector3 beginPosition;
    public Vector3 targetPosition;
    public float totalTime = 10;


	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

	    transform.position = Vector3.Lerp(beginPosition, targetPosition, Time.time / totalTime);
	}
}
