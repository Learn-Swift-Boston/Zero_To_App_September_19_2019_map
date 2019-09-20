//
//  ViewController.swift
//  Boston Travel
//
//  Created by Curtis Colly on 9/19/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var map: MKMapView!
    @IBOutlet var tableView: UITableView!
    
    let manager = CLLocationManager()
    var pins = [CLLocationCoordinate2D]()
    let names = ["Boston Common", "Bunker Hill", "Tea Party Museum"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        pins = [CLLocationCoordinate2D(latitude: 42.35, longitude: -71.06), CLLocationCoordinate2D(latitude: 42.38, longitude: -71.06), CLLocationCoordinate2D(latitude: 42.35, longitude: -71.05)]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        map.showsUserLocation = true
        
        addAnotations()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.requestWhenInUseAuthorization()
        
    }
    
    func addAnotations(){
        
        for pin in pins {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)
            
            map.addAnnotation(annotation)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let title = names[indexPath.row]
        cell.textLabel!.text = title
        
        return cell
    }
    
   
}

