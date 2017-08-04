//
//  Capital.swift
//  Maps
//
//  Created by Jonathan Go on 2017/08/04.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {

    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
