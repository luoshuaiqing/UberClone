//
//  LocationHandler.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/28/21.
//

import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    static let shared = LocationHandler()
    let locationManager: CLLocationManager! = CLLocationManager()
    var location: CLLocation?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
