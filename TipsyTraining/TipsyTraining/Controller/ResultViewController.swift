//
//  ResultViewController.swift
//  TipsyTraining
//
//  Created by Zulfikar Abdul Rahman Suwardi on 02/11/22.
//

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  var splitBill: String?
  var numberOfPerson: Int?
  var tip: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    totalLabel.text = splitBill
    settingsLabel.text = "Split between \(numberOfPerson ?? 2) people, with \(tip ?? "10%") tip."
      
  }
  
  @IBAction func recalculatedPressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  
}
