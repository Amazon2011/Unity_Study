﻿using UnityEngine;
using System.Collections;

public class LightFlicker : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        light.intensity = Random.Range(0.4f, 4.0f);
	}
}
