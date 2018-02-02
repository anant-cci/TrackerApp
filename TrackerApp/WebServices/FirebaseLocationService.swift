//
//  FirebaseLocationService.swift
//  TrackerApp
//
//  Created by Anant Kannaik on 02/02/18.
//  Copyright © 2018 CCI. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseLocationService {
    
    var ref: DatabaseReference!
    
    func fetchLocations(completion: @escaping (Bool, [Location]) -> Void) {
        self.ref = Database.database().reference()
        
        self.ref.child("Locations").observe(.value, with: {(snapshot) in
            
            var locations = [Location]()
            
            for child in snapshot.children {
                let value = (child as! DataSnapshot).value as? NSDictionary
                let latitude = value?["latitude"] as! Double
                let longitude = value?["longitude"] as! Double
                
                let location = Location.init(latitude: Double(latitude), longitude: Double(longitude))
                
                locations.append(location)
            }
            completion(true, locations)
        })
    }
    
    func saveLocation(location: Location, completion: @escaping (Bool) -> Void) {
        self.ref = Database.database().reference()
        let key = self.ref.childByAutoId().key
        self.ref.child("Locations").child(key).setValue(["latitude": location.latitude, "longitude": location.longitude])
        completion(true)
    }
}
