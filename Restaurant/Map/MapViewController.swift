//
//  MapViewController.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/30/24.
// 영등포 새싹 좌표 37.517742, 126.886463

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    let menuList:[Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        configureSegmentedControl()
        
        
//        let center = CLLocationCoordinate2DMake(37.517742, 126.886463)
//        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
//        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = center
//        mapView.addAnnotation(annotation)
//        annotation.title = "SeSSAC"
//        
        makeAnnotation()
        
        
    }
    func configureSegmentedControl() {
       
        segmentedControl.selectedSegmentIndex = 3
        segmentedControl.setTitle("한식", forSegmentAt: 0)
        segmentedControl.setTitle("일식", forSegmentAt: 1)
        segmentedControl.setTitle("중식", forSegmentAt: 2)
        // 음식점 리스트를 for문으로 돌면서
        // 인덱스가 0일 때 모든 카테고리의 음식을 보여줘라
        //
        if segmentedControl.selectedSegmentIndex == 2 {
            makeAnnotation()
            segmentedControl.reloadInputViews()
            for menu in menuList {
                
                if menu.category == "한식" {
                    makeAnnotation()
                    
                }
                
                
            }
            
            
        }
        
        
    
    }
 
    func makeAnnotation() {
        let center = CLLocationCoordinate2DMake(37.517742, 126.886463)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        annotation.title = "SeSSAC"
        
    }

    

}
