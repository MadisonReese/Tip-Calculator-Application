//
//  ViewController.swift
//  tip
//
//  Created by Madison R Reese on 9/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var gratuityLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var splitControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        //Get rid of resources that can be recreated
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
        //removes keyboard from screen
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
    //Get the initial bill amount and calculate the tips, total, and split
        let splitNum = [1.00, 2.00, 3.00, 4.00, 5.00]
        let tipPercentage: Double = Double(tipControl.value)
        let bill = Double(billField.text!) ?? 0
        let gratuity: Double = bill * (tipPercentage / 100)
        let total: Double = bill + gratuity
        let split: Double = total/splitNum[splitControl.selectedSegmentIndex]

    //Update the tip and total label
        gratuityLabel.text = String(format: "$%.2f", gratuity)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", split)
        tipLabel.text = String(format: "Tip: %02d%%", Int(tipPercentage))
    }
}


