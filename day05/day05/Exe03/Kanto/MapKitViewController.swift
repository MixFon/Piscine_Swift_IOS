//
//  MapKitViewController.swift
//  Kanto
//
//  Created by Михаил Фокин on 30.11.2020.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    let locatinManager = CLLocationManager()
    let locationName = Location.allNameLocation
    
    @IBAction func segmentControll(_ sender: Any) {
        print(sender)
        print("Hello")
    }
    
    @IBAction func sementControlMap(_ sender: UISegmentedControl) {
        print("press \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            break
        case 1:
            mapView.mapType = .satellite
            break
        default:
            mapView.mapType = .hybrid
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for location in Location.allNameLocation{
            mapView.addAnnotation(location)
        }
        // Do any additional setup after loading the view.
    }
   
    // Когда view карты прогрузилось вызываем проверку.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    // Проверка геолокации.
    // Если она не включена, то вызываем алетр с переходом в настройки для включения
    func checkLocationEnabled() {
        
        if CLLocationManager.locationServicesEnabled() {
            // Если все нормально и геолокация включена устанавливаем настроки
            setupManager()
            checkAuthorization()
        }else {
            showAlertLacation(title: "Служба геолокации выключена", message: "Включите геолокацию", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func setupManager(){
        // Установка делегата
        locatinManager.delegate = self
        // Установка точности геолокации. (самая высокая)
        locatinManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways: // Используется всегда
            break
        case .authorizedWhenInUse: // Используется только при использовании приложения
            // Если разрешена, то показываем локацию пользователя
            mapView.showsUserLocation = true
            locatinManager.startUpdatingLocation()
            break
        case .denied: // Запрещено использовать локацию
            showAlertLacation(title: "Использования мусположения запрещеною", message: "Измените это в настройках" , url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locatinManager.requestWhenInUseAuthorization()
        }
    }
   
    func showAlertLacation(title: String, message: String?, url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) {_ in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let celcelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(celcelAction)

        present(alert, animated: true, completion: nil)
    }
}
// Наследуем делегат
// Реализация делегата
extension MapKitViewController: CLLocationManagerDelegate {
    //Устанавливаем регеон при обновлении локации на старте
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Устанавливаем стартовый регирн в регион Ecole 42
        let loca = Location.allNameLocation[0].coordinate
        let region = MKCoordinateRegion(center: loca, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
    // Если пользователь поменяд аторизацию
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
}
