//
//  MapViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let nevaTowerPoint: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: nevaTower.longtitude, longitude: nevaTower.latitude)
        return annotation
        
    }()
    
    let eyeTowerPoint: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: eyeTower.longtitude, longitude: eyeTower.latitude)
        return annotation
        
    }()
    
    
    let eyeTowerSecondPoint: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: eyeTowerSecond.longtitude, longitude: eyeTowerSecond.latitude)
        return annotation
        
    }()
    
    let towerUnderWaterPoint: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: towerUnderWater.longtitude, longitude: towerUnderWater.latitude)
        return annotation
        
    }()
    
    let eurasiaPoint: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: eurasia.longtitude, longitude: eurasia.latitude)
        return annotation
        
    }()
    
    var pointsArray: [MKPointAnnotation] {
        [eyeTowerPoint, eyeTowerSecondPoint, nevaTowerPoint, eurasiaPoint, towerUnderWaterPoint]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // add function to hide this code
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        mapView.addAnnotations(pointsArray)
        
    }
}
