//
//  HomeController.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/5/21.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {

    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    private let inputActivationView = LocationInputActivationView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
    }

    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false)
            }
        } else {
            configureUI()
            enableLocaationServices()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureMapView()
        
        view.addSubview(inputActivationView)
        inputActivationView.centerX(view: view)
        inputActivationView.setDimensions(width: view.frame.width - 64, height: 50)
        inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }
    
    func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}

// MARK: - Location Services
extension HomeController: CLLocationManagerDelegate {
    
    func enableLocaationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("DEBUG: Not determined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("DEBUG: Not allowed")
            break
        case .authorizedAlways:
            print("DEBUG: Auth always")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
