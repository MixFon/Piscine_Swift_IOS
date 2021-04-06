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
    var startCoordinage : CLLocationCoordinate2D?
    
    @IBAction func pressMyLocation(_ sender: UIButton) {
        if let loca = startCoordinage {
            setCoordinateToMap(coordinate: loca)
        }
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
        // Устанавливаем стартовый регирн в регион Ecole 42
        setCoordinateToMap(coordinate: Location.allNameLocation[Location.selectCell].coordinate)
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
        // Устанавливаем сатртовую позицию пользователя
        locatinManager.startUpdatingLocation()
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
extension MapKitViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("locationManagerDidPauseLocation")
    }
    //Устанавливаем регеон при обновлении локации на старте
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("mapextention")
        // Запоминаем стартовые координаты
        self.startCoordinage = manager.location?.coordinate
    }
    // Если пользователь поменяд аторизацию
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        print("didResumeLoc")
    }
    
    private func setCoordinateToMap(coordinate: CLLocationCoordinate2D) {
        let local = coordinate
        let region = MKCoordinateRegion(center: local, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
    
    // Вызывается когда выбрали булавку
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("press pin didSelect \(view.isHighlighted)")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("mapVeiw")
        let annotationLable = UILabel(frame: CGRect(x: 15, y: -35, width: 105, height: 30))
        annotationLable.numberOfLines = 2
        annotationLable.textAlignment = .left
        annotationLable.font = UIFont(name: "Rockwell", size: 12)
        annotationLable.text = annotation.title!
        let annotarionSubLeble = UILabel(frame: CGRect(x: 15, y: -20, width: 105, height: 30))
        annotarionSubLeble.numberOfLines = 3
        annotarionSubLeble.textAlignment = .left
        annotarionSubLeble.font = UIFont(name: "Rockwell", size: 8)
        annotarionSubLeble.text = annotation.subtitle!
        let newAnnotation = annotation as? Location
        let anat = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        anat.pinTintColor = newAnnotation?.color
        anat.animatesDrop = true
        anat.addSubview(annotationLable)
        anat.addSubview(annotarionSubLeble)
        return anat
    }
}
