//
//  Location.swift
//  TrackerApp
//
//  Created by Anant Kannaik on 02/02/18.
//  Copyright © 2018 CCI. All rights reserved.
//

import Foundation

class Location {
    var latitude: Double?
    var longitude: Double?
    
    init(latitude: Double?, longitude: Double?) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
