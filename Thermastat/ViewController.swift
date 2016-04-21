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

    let header = ["Authorization": "Bearer QvdV46oxGURLrOL5EsazVH7pyZHCmC4JYXpNtWpBLlhL9eVlr6FIZGkTWI9Hxgydkpnzm2lU9vA8sS01Kkv0Jn",
                  "Content-Type":"application/json"]
    
    
    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var UserAction: UITextField!
    @IBOutlet weak var EventDate: UITextField!
    
    @IBOutlet weak var WeightSlider: UISlider!
    @IBOutlet weak var WeightGoalSlider: UISlider!
    @IBOutlet weak var GoalDurationSlider: UISlider!
    @IBOutlet weak var CalIntakeSlider: UISlider!
    
    
    @IBOutlet weak var Initbutton: UIButton!
    @IBOutlet weak var InteractionButton: UIButton!
    @IBOutlet weak var ScaleButton: UIButton!
    @IBOutlet weak var GoalButton: UIButton!
    
    
    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var WeightGoalLabel: UILabel!
    @IBOutlet weak var DurationLabel: UILabel!
    @IBOutlet weak var CalIntakeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //SendButton.addTarget(self, action: #selector(ViewController.sendPressed(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    func sendPressed(sender: UIButton!) {
        let url = "https://ingestion-r8xxs5mrp6s7.us3.sfdcnow.com/streams/device_data_home001/device_events_hom001/event"
        let URL = NSURL(string: url)!
//        
//        
//
//        
//        
//        let data = ["D_id":self.DeviceName.text!,
//                    "Status": self.StateSegement.selectedSegmentIndex.description,
//                    "Operational_data": [
//                        "Cap_Voltage" : "\(self.CapSlider.value)",
//                        "Bat_Voltage" : "\(self.BatSlider.value)"
//                        ]
//                    
//                    ]
//        
//        
//        Alamofire.request(.POST, URL, parameters: (data as! [String : AnyObject]), encoding: ParameterEncoding.JSON, headers: header)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

