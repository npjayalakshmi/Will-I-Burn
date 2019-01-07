//
//  ViewController.swift
//  Will I Burn1
//
//  Created by natarajan k on 03/01/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate {
    let LocationManager = CLLocationManager()
    var coords:CLLocationCoordinate2D?

    @IBOutlet weak var SkinTypeChangeLabel: UILabel!
    var SkinTypes : String = SkinType().type3 {
        didSet{
            ChangeSkinTypeLabel()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.delegate = self

        LocationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func ClickToChnageSkinType(_ sender: Any) 
    
    {
        
        let alert = UIAlertController(title: "Skin Type?", message: "Please Choose One", preferredStyle: .actionSheet)
        for st in SkinType().allSkinTypes(){
            alert.addAction(UIAlertAction(title: st, style: .default, handler: { (action) in
                self.SkinTypes = action.title!
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse){
            print("LOCATION authorised")
        }else if(status == .denied){
            print("Location denied")
            let alert = UIAlertController(title: "ERROR!", message: "Allow app to access your location via settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true,completion: nil)
        }
        func getLocation(){
            if let loc = LocationManager.location{
                coords = loc.coordinate
            }
        }
    }

    func ChangeSkinTypeLabel(){
        SkinTypeChangeLabel.text = "Skin Type : " + SkinTypes
    }

}
