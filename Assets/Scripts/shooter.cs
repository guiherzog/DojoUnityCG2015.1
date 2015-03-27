using UnityEngine;
using System.Collections;

public class shooter : MonoBehaviour {

	public GameObject bulletPrefab;
	public float Forca=10000.0f;
	public float WaitTime=0.4f;

	private float time;
	// Use this for initialization
	void Start () {
		time = Time.time;
	}
	
	// Update is called once per frame
	void Update () {
		float deltaTime = Time.time - time;

		if (Input.GetAxis("Fire1") >0  && deltaTime > WaitTime) {
			GameObject bullet = Instantiate(bulletPrefab) as GameObject;
			bullet.transform.position = this.transform.position;
			bullet.rigidbody.AddForce(this.transform.forward*Forca);
			time=Time.time;

			audio.Play();		
		}
	}
}
