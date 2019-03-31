//
//  CustomAnnotationView.swift
//  TappableCalloutDemo
//
//  Created by Robert Ryan on 3/31/19.
//  Copyright © 2019 Robert Ryan. All rights reserved.
//

import Foundation
import MapKit

protocol CustomAnnotationViewDelegate: class {
    func didTapCallout(for annotation: MKAnnotation)
}

class CustomAnnotationView: MKPinAnnotationView {
    static let preferredReuseIdentifier = Bundle.main.bundleIdentifier! + ".customAnnotationView"
    
    weak var delegate: CustomAnnotationViewDelegate?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        canShowCallout = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAnnotationView(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapAnnotationView(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        
        // ignore taps on the annotation view, itself
        
        if bounds.contains(location) { return }
        
        // if we got here, we must have tapped on the callout
        
        delegate?.didTapCallout(for: annotation!)
    }
}
