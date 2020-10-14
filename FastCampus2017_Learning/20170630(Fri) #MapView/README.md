# 패스트캠퍼스 강의 노트 37th ( 20170630 )

# 오늘의 Tip

## Install an app in the Device

 - Certificates - mac
 - App ID (Bundle ID)
 - Device ID

이 3가지를 합쳐서 `Provisioning`이 된다.

Project에는 Provisioning이 담긴다.

Project를 다른 맥북으로 가져가서 빌드시키면, Certifcate를 가져온다. 그러나, 인증된 맥이 아니면 앱을 출시할 수 없다.


Cetificate는 막 만들지 않는다.
OS는 App이 다른 것을 App ID(Bundle ID)로 판단한다. 이게 Primary Key, 즉 고유값이 된다.


# MapView

## MapKit

```swift
let regionRadius: CLLocationDistance = 1000let location = CLLocation(latitude: 37.515675, longitude: 127.021378)let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
mapView.setRegion(coordinateRegion, animated: true)

    //setLocation Locationlet location = CLLocation(latitude: 37.515675, longitude: 127.021378)let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)mapView.setRegion(coordinateRegion, animated: true)
```

## Annotation
 - MKAnnotation Protocol을 사용하여 annotation 클래스 생성.
 - annotation 인스턴스 생성 후 Mapview에 Add

### `Example`

```swift
@IBOutlet weak var mapView: MKMapView!
let manager = CLLocationManager()
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    
    let regionRadius: CLLocationDistance = 250
//        let location = CLLocation(latitude: 37.515675, longitude: 127.021378) //서울
    let location = CLLocation(latitude: 40.7080316, longitude: -74.0150074)
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    
    mapView.setRegion(coordinateRegion, animated: true)
    
    let newCoordinate = CLLocationCoordinate2D(latitude: 40.7080316, longitude: -74.0150074)
    
    let pin1 = MyAnnotation(coordinate: newCoordinate)
    pin1.title = "newyork"
    pin1.subtitle = "My Favorite Place"
    
    mapView.addAnnotation(pin1)
    manager.delegate = self
}

@IBAction func buttonUserLocationAction(_ sender: UIButton) {
    manager.requestAlwaysAuthorization()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.startUpdatingLocation()
    
    mapView.showsUserLocation = true
    
    let regionRadius: CLLocationDistance = 250
    let coordinateRegion = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, regionRadius * 2.0, regionRadius * 2.0)
    
    mapView.setRegion(coordinateRegion, animated: true)
}
```


---
### 문서 끝 ( by 재성 )