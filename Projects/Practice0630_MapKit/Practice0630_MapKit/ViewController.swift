//
//  ViewController.swift
//  Practice0630_MapKit
//
//  Created by leejaesung on 2017. 6. 30..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let regionRadius: CLLocationDistance = 250
//        let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
        let location = CLLocation(latitude: 40.7080316, longitude: -74.0150074)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
        let newCoordinate = CLLocationCoordinate2D(latitude: 40.7080316, longitude: -74.0150074)
        
        let pin1 = MyAnnotation(coordinate: newCoordinate)
        pin1.title = "newyork"
        pin1.subtitle = "My Favorite Place"
        
        mapView.addAnnotation(pin1)
        manager.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonUserLocationAction(_ sender: UIButton) {
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        let regionRadius: CLLocationDistance = 250
//        let location = CLLocation(latitude: 40.7080316, longitude: -74.0150074)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }

    @IBAction func buttonNewyorkAction(_ sender: UIButton) {
    }
}

