//
//  LocationViewModel.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import Foundation
import Observation

@Observable
class LocationsViewModel {
    var locations: [Location]
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
