//
//  ViewController.swift
//  Prework
//
//  Created by Qinran Wang on 8/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var partySizeControl: UIStepper!
    @IBOutlet weak var partySize: UILabel!
    
    @IBOutlet weak var perPersonCost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        // Get bill amount for text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip_1 = defaults.double(forKey: "tip1")
        let partySizeChange = defaults.double(forKey: "partySizeChange")
        
        // Get Total tip by multiplying tip * tipPercentages
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        defaults.set(total, forKey: "total")
        
        let perPerson = total/partySizeChange
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format:"$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format:"$%.2f", total)
        perPersonCost.text = String(format:"$%.2f",perPerson)
        defaults.synchronize()
        
    }
    
    
    @IBAction func partySizeChange(_ sender: UIStepper) {
        let defaults = UserDefaults.standard
        partySize.text = String(Int(sender.value))
        defaults.set(sender.value, forKey: "partySizeChange")
        let total = defaults.double(forKey: "total")
        let perPerson = total/sender.value
        perPersonCost.text = String(format:"$%.2f",perPerson)
        defaults.synchronize()
    }
    
}

