//
//  ViewController.swift
//  TipsyTraining
//
//  Created by Zulfikar Abdul Rahman Suwardi on 02/11/22.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  var tipValue = 0.1
  var splitPerson = 2
  var billTotal = 0.0
  var spiltBill: String?
  var tipPercentage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func tipChanged(_ sender: UIButton) {
//    print(sender.currentTitle!)
    if sender.currentTitle! == "0%" {
      tipValue = 0.0
      tipPercentage = sender.currentTitle!
      zeroPctButton.isSelected = true
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = false
    } else if sender.currentTitle! == "10%" {
      tipValue = 0.1
      tipPercentage = sender.currentTitle!
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = true
      twentyPctButton.isSelected = false
    } else {
      tipValue = 0.2
      tipPercentage = sender.currentTitle!
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = true
    }
    billTextField.endEditing(true)
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
//    print(sender.value)
    splitPerson = Int(sender.value)
    splitNumberLabel.text = String(format:"%.0f", sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
//    print(splitPerson)
//    print(billTextField.text!)
    billTotal = Double(billTextField.text!) ?? 0
    let result = billTotal * (1 + tipValue) / Double(splitPerson)
    let result2 = String(format:"%.2f", result)
    spiltBill = result2
//    print(result2)
    performSegue(withIdentifier: "goToResult", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "goToResult" {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.splitBill = spiltBill
        destinationVC.numberOfPerson = splitPerson
        destinationVC.tip = tipPercentage
        
      }
    }
}

