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
        Initbutton.addTarget(self, action: #selector(ViewController.sendInitEvent(_:)), forControlEvents: .TouchUpInside)
        InteractionButton.addTarget(self, action: #selector(ViewController.sendInteractEvent(_:)), forControlEvents: .TouchUpInside)
        ScaleButton.addTarget(self, action: #selector(ViewController.sendScaleUpdateEvent(_:)), forControlEvents: .TouchUpInside)
        GoalButton.addTarget(self, action: #selector(ViewController.sendGoalEvent(_:)), forControlEvents: .TouchUpInside)
        
        
        WeightSlider.addTarget(self, action: #selector(ViewController.weightValueChanged(_:)), forControlEvents: .ValueChanged)
         WeightGoalSlider.addTarget(self, action: #selector(ViewController.weightgoalValueChanged(_:)), forControlEvents: .ValueChanged)
         GoalDurationSlider.addTarget(self, action: #selector(ViewController.durationChanged(_:)), forControlEvents: .ValueChanged)
         CalIntakeSlider.addTarget(self, action: #selector(ViewController.calIntakeValueChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    
    
    func weightValueChanged(sender: AnyObject){
        self.WeightLabel.text = "\(self.WeightSlider.value)"
    }
    func weightgoalValueChanged(sender: AnyObject){
        self.WeightGoalLabel.text = "\(self.WeightGoalSlider.value)"
    }
    func durationChanged(sender: AnyObject){
        self.DurationLabel.text = "\(self.GoalDurationSlider.value)"
    }
    func calIntakeValueChanged(sender: AnyObject){
        self.CalIntakeLabel.text = "\(self.CalIntakeSlider.value)"
    }
    
    
    func sendInitEvent(sender: UIButton!) {
        let url = "https://ingestion-5mj009w3h445.test.sfdc-matrix.net/streams/customer_centric_001/initializing_even001/event"
        let URL = NSURL(string: url)!
        
        let data = [ "userId":self.UserID.text!]
        Alamofire.request(.POST, URL, parameters: data, encoding: ParameterEncoding.JSON, headers: header)
        
    }
    
    
    func sendInteractEvent(sender: UIButton!) {
        let url = "https://ingestion-5mj009w3h445.test.sfdc-matrix.net/streams/customer_centric_001/user_interactions001/event"
        let URL = NSURL(string: url)!
        
        let data = [ "userId":self.UserID.text!,
                     "action":self.UserAction.text!
        ]
        
        Alamofire.request(.POST, URL, parameters: data, encoding: ParameterEncoding.JSON, headers: header)
        
    }
    
    
    func sendScaleUpdateEvent(sender: UIButton!) {
        let url = "https://ingestion-5mj009w3h445.test.sfdc-matrix.net/streams/customer_centric_001/scale_updates001/event"
        let URL = NSURL(string: url)!
        
        let data = [ "userId":self.UserID.text!,
                     "weightMeasure":self.WeightSlider.value,
                      "date":self.EventDate.text!
        ]
        
        Alamofire.request(.POST, URL, parameters: (data as! [String : AnyObject]), encoding: ParameterEncoding.JSON, headers: header)
        
    }
    
    
    func sendGoalEvent(sender: UIButton!) {
        
        let url = "https://ingestion-5mj009w3h445.test.sfdc-matrix.net/streams/customer_centric_001/goal_updates001/event"
        let URL = NSURL(string: url)!
        
        let data = [ "userId":self.UserID.text!,
                     "startDate":self.EventDate.text!,
                     "weightGoal":self.WeightGoalSlider.value,
                     "duration":self.GoalDurationSlider.value,
                     "calorieIntake":self.CalIntakeSlider.value
        ]
        
        Alamofire.request(.POST, URL, parameters: (data as! [String : AnyObject]), encoding: ParameterEncoding.JSON, headers: header)
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

