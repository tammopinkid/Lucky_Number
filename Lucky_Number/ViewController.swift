//
//  ViewController.swift
//  Lucky_Number
//
//  Created by Kamonwat Rojjanadechakul on 11/15/2560 BE.
//  Copyright © 2560 Benjarat Saeang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedNumber : String?
    
    @IBOutlet weak var shakedNumLabel: RoundLabel!
    
    @IBAction func unwindToMain(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedNumber = "20"
        shakedNumLabel.text = "20"
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEventSubtype.motionShake) {
            
            do {
                let num = random(20..<41)
                print(num)
                selectedNumber = String(num)
                shakedNumLabel.text = String(num)
            }
            catch let error as NSError {
                selectedNumber = nil
            }
            
        }
    }
    
    func random(_ range:Range<Int>) -> Int
    {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.selectedNum = selectedNumber
    }


}

