//
//  ListLocation.swift
//  Kanto
//
//  Created by Михаил Фокин on 30.11.2020.
//

import Foundation
import UIKit
import MapKit

class Location: NSObject, MKAnnotation {
    // Обязательный параметр, который нужно определить. (для класса MKAnnotation)
    var coordinate: CLLocationCoordinate2D
    var nameLocation : String
    // Не обязательный параметр. Отвеат за название Pin (для класса MKAnnotation)
    var title: String? {
        return nameLocation
    }
    // Не обязательный параметр. Отвеат за описание под Pin (для класса MKAnnotation)
    var subtitle: String?
    
    init(nameLocation: String, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.nameLocation = nameLocation
        self.subtitle = subtitle
        super.init()
    }
}

extension Location {
    static var allNameLocation: [Location] {
        return [
            Location(nameLocation: "Ecole 42", subtitle: "Школа программирования", coordinate: CLLocationCoordinate2D(latitude: 48.897194, longitude: 2.318089)),
            Location(nameLocation: "Школа 21", subtitle: "Самая лучшая школа программирования!", coordinate: CLLocationCoordinate2D(latitude: 55.797259, longitude: 37.579322))
            ]
            //Location(nameLocation: "Saint Ouen"),
            //Location(nameLocation: "Grenoble"),
            //Location(nameLocation: "Reims"),
            //Location(nameLocation: "Moldavie"),
            //Location(nameLocation: "Circuit")
        
    }
}
