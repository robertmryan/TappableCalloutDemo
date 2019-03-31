//
//  ViewController.swift
//  TappableCalloutDemo
//
//  Created by Robert Ryan on 3/31/19.
//  Copyright © 2019 Robert Ryan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            mapView.register(CustomAnnotationView.self,
                             forAnnotationViewWithReuseIdentifier: CustomAnnotationView.preferredReuseIdentifier)
        }
        
        addRandomAnnotation()
    }

    func addRandomAnnotation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Statue of Liberty") { placemarks, _ in
            guard
                let placemark = placemarks?.first,
                let coordinate = placemark.location?.coordinate else { return }
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = placemark.name
            
            let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: 20000, pitch: 0, heading: 0)
            self.mapView.setCamera(camera, animated: true)
            self.mapView.addAnnotation(annotation)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView: CustomAnnotationView?
        
        if #available(iOS 11.0, *) {
            annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.preferredReuseIdentifier,
                                                                   for: annotation) as? CustomAnnotationView

            annotationView?.delegate = self
        } else {
            annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.preferredReuseIdentifier) as? CustomAnnotationView
            if annotationView == nil {
                annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: CustomAnnotationView.preferredReuseIdentifier)
                annotationView?.delegate = self
            } else {
                annotationView?.annotation = annotation
            }
        }
        
        return annotationView
    }
}

extension ViewController: CustomAnnotationViewDelegate {
    func didTapCallout(for annotation: MKAnnotation) {
        print("tapped callout for \(annotation)")
    }
}
