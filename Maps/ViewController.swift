//
//  ViewController.swift
//  Maps
//
//  Created by Jonathan Go on 2017/08/04.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222,  longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95,  longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567,  longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9,  longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111,  longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotation(london)
        mapView.addAnnotation(oslo)
        mapView.addAnnotation(paris)
        mapView.addAnnotation(rome)
        mapView.addAnnotation(washington)
        
        //another way of adding annotation
        //mapView.addAnnotations([london, oslo, paris, rome, washington])
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //1. define a reuse identifier. This is a string to ensure we reuse annotation views as much as possible.
        let identifier = "Capital"
        
        //2. check whether the annotation we're creating a view for is one of our Cpital objects.
        if annotation is Capital {
        
            //3. try to dequeue annotation view from the mapview's pool of unused views.
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
            
                //4. if it isn't able to find a reusable view, create a new one using MKPinAnnotationView and sets its canShowCallout property to true. This triggers the popup with the city name.
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                //5. create a new UIButton using the built in .detailDisclosure type, this is a small blue "i" symbol with a circle around it.
                let btn = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
                
            } else {
                
                //6. if it can reuse a view, update that view to use a different annotation
                annotationView!.annotation = annotation
                
            }
                
            return annotationView
        }
        
        //7. if the annotation isnt from a Capital city, it must return a nil so iOS returns a default view
        return nil

    }
    
    //this method will tell you what mapView sent it and what annotationView did the button came from (no need for addTarget() like in buttons) as well as what button was tapped.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let capital = view.annotation as! Capital
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }


}

//map annotation - contains a title, subtitle and position.  Map annotation is a protocol









