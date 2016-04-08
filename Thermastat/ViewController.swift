//
//  ViewController.swift
//  Thermastat
//
//  Created by Karson Miller on 4/6/16.
//  Copyright © 2016 Karson Miller. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet var DeviceName : UITextField!
    @IBOutlet var CapSlider : UISlider!
    @IBOutlet var BatSlider : UISlider!
    @IBOutlet var StateSegement : UISegmentedControl!
    @IBOutlet var SendButton : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        SendButton.addTarget(self, action: #selector(ViewController.sendPressed(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    func sendPressed(sender: UIButton!) {
        let url = "https://ingestion-r8xxs5mrp6s7.us3.sfdcnow.com/streams/device_data_home001/device_events_hom001/event"
        let URL = NSURL(string: url)!
        
        

        let header = ["Authorization": "Bearer 9njon90NAkISmq73jFwwlqS24u3ykfJAOVEIMfaNYW8eJEIDUvLYam4fEX6mc5RqNfRWTCVPRNugggzZxtle9n",
                      "Content-Type":"application/json"]
        
        let data = ["D_id":self.DeviceName.text!,
                    "Status": self.StateSegement.selectedSegmentIndex.description,
                    "Operational_data": [
                        "Cap_Voltage" : "\(self.CapSlider.value)",
                        "Bat_Voltage" : "\(self.BatSlider.value)"
                        ]
                    
                    ]
        
        
        Alamofire.request(.POST, URL, parameters: (data as! [String : AnyObject]), encoding: ParameterEncoding.JSON, headers: header)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

