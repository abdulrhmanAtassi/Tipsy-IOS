//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitNumber = 2
    var bill = 0.0
    var tip = 0
    var billForPerson = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        allOff()
        billTextField.endEditing(true)
        s(sender.currentTitle!)
        sender.isSelected = true
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper ) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.f", sender.value)
        splitNumber = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        bill = Double( billTextField.text!) ?? 0.0
        let percentage = calculatePercentage(value: bill,percentageVal: Double(tip))
        let fullBill = bill + percentage
        billForPerson = fullBill / Double(splitNumber)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.billForPerson = billForPerson
                destinationVC.tip = tip
                destinationVC.splitNumber = splitNumber
                
            }
        }
    
    
    func allOff(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func s(_ t:String){
        switch t {
        case "10%":
            tip = 10
        case "20%":
            tip = 20
        default:
            tip = 0
        }
    }
    
    func calculatePercentage(value:Double,percentageVal:Double) -> Double{
        if percentageVal != 0{
            let val = value * percentageVal
            return val / 100.0
        }
        return value
    }
}

