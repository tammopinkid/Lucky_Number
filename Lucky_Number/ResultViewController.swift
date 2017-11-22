//
//  ResultViewController.swift
//  Lucky_Number
//
//  Created by Kamonwat Rojjanadechakul on 11/15/2560 BE.
//  Copyright © 2560 Benjarat Saeang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var i : Int?
    var match : Int = 0
    var resultList = [String]()
    var selectedNum : String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var randomList: UILabel!
    @IBOutlet weak var selectedNumLabel: RoundLabel!
    @IBOutlet weak var newLuckyDrawBtn: RoundButton!
    @IBAction func backToMain(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToMain", sender: self)
    }
    
    func random(_ range:Range<Int>) -> Int
    {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("second")
//        for i in 0...4 {
//            let num = random(20..<41)
//            print(num)
//            let stringNum = String(num)
//            resultList.append(stringNum)
//            if selectedNum == stringNum {
//                match += 1
//            } else {
//                match += 0
//            }
//        }
        print(">>>",resultList.count)
        while (resultList.count<5){
            let num = random(20..<41)
            print(num)
            let stringNum = String(num)
            if (!resultList.contains(stringNum)){
                resultList.append(stringNum)
                print("resultList",resultList)
            }
            if selectedNum == stringNum {
                match += 1
            } else {
                match += 0
            }
        }
        print(resultList)
        print("match : ",match)
        
        if match > 0 {
            resultLabel.text = "You Win!!!"
            resultImage.image = UIImage(named: "star")
        } else {
            resultLabel.text = "You Lose!!!"
            resultImage.image = UIImage(named: "mail")
        }
        let arrayList = resultList.joined(separator: ", ")
        randomList.text = arrayList
        selectedNumLabel.text = selectedNum
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let mainViewController = segue.destination as! ViewController
        
        mainViewController.selectedNumber = "20"
        mainViewController.shakedNumLabel.text = "20"
    }


}
