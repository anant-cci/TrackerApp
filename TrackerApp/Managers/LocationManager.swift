//
//  LocationManager.swift
//  TrackerApp
//
//  Created by Anant Kannaik on 02/02/18.
//  Copyright © 2018 CCI. All rights reserved.
//

import Foundation

class LocationManager {
    
    // MARK:- Singleton
    static private let sharedInstance = LocationManager()
    
    static func sharedLocationManager() -> LocationManager {
        return sharedInstance
    }
    
    // MARK: Private variables
    private let locationService = FirebaseLocationService()
    
    func fetchLocations(completion: @escaping (Bool, [Location]) -> Void) {
        self.locationService.fetchLocations { (status, locations) in
            completion(status, locations)
        }
    }
    
    func saveLocation(location: Location) {
        self.locationService.saveLocation(location: location) { (result: Bool) in
            
        }
    }
}
