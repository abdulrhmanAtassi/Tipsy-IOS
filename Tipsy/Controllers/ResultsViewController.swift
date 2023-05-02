//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abdulrhman on 01/05/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var splitNumber = 2
    var billForPerson: Double?
    var tip = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "0.2f", billForPerson!)
        settingsLabel.text = "Split between \(splitNumber) people, with \(tip)% tip."
    }
    
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
