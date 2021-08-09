//
//  SettingsViewController.swift
//  Prework
//
//  Created by Qinran Wang on 8/5/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    
    @IBOutlet weak var tip1: UITextField!
    
    @IBOutlet weak var dayNightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tip1Change(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tip1Changed = Double(tip1.text!) ?? 0
        defaults.set(tip1Changed, forKey: "tip1")
        defaults.synchronize()
    }
    
    @IBAction func switchDidChange(_ sender:UISwitch ) {
        let defaults = UserDefaults.standard
        if sender.isOn{
            view.backgroundColor = .black
            text.textColor = .white
            text1.textColor = .white
            text2.textColor = .white
            text3.textColor = .white
            text4.textColor = .white
        }
        else {
            
            view.backgroundColor = .white
            text.textColor = .black
            text1.textColor = .black
            text2.textColor = .black
            text3.textColor = .black
            text4.textColor = .black
            defaults.set(sender.isOn, forKey: "Switch")
        }
        defaults.synchronize()
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
