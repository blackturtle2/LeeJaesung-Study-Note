//
//  MyAnnotation.swift
//  Practice0630_MapKit
//
//  Created by leejaesung on 2017. 6. 30..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import MapKit


class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    
    init(coordinate:CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }

}
