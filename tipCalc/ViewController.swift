//
//  ViewController.swift
//  tipCalc
//
//  Created by Deon Labrador on 1/8/20.
//  Copyright © 2020 Deon Labrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTip: UIButton!
    
    var bill = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        billField.keyboardType = UIKeyboardType.decimalPad
       
        customTipField.keyboardType = UIKeyboardType.decimalPad
       
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(false)
    }
  
    
    @IBAction func calcCustomTip(_ sender: Any) {
       
        bill = Double(billField.text!) ?? 0
       
        var customTip = Double(customTipField.text!) ?? 0
        customTip = customTip/100
        let cTip = bill * customTip
        let cTotal = bill + cTip
        tipLabel.text = String(format: "+ $%.2f", cTip)
        totalLabel.text = String(format: "$%.2f", cTotal)
        customTipField.text = String(customTip * 100) + "%"
        
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get the bill amount
         bill = Double(billField.text!) ?? 0
        
        //calc tip and total
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip and total label
        tipLabel.text = String(format: "+ $%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
}

