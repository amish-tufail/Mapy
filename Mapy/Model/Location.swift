//
//  Location.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String { // did because there are multiple same name
        name + cityName
    }
}
