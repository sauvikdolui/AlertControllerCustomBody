//
//  ViewController.swift
//  AlertControllerCustomBody
//
//  Created by Sauvik Dolui on 07/10/16.
//  Copyright © 2016 Innofied Solution Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func showCustomBodyAlert(_ sender: UIButton) {
    showCustomAlertVC(checkMarkString: "Viernes 12")
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func showCustomAlertVC(checkMarkString: String){
    
    let watingListAlert = UIAlertController(title: "Lista De espera", message: "Algunos días seleccionados, no poseen disponibilidad en el chárter. Puede inscribirse a la lista de espera y el sistema lo tendrá en cuenta cuando algún espacio se libere\n\n\n", preferredStyle: .alert)
    
    
    if let alertContentView = watingListAlert.view.subviews[0].subviews.last?.subviews.first?.subviews.first?.subviews[0] {
      
      
      //      let titleLabel = alertContentView.subviews[0] as! UILabel
      //      let messageLabel = alertContentView.subviews[1] as! UILabel
      
      
      let fridayLabel = UILabel(frame: CGRect(x: 20, y: 145, width: 100.0, height: 18.0))
      fridayLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
      fridayLabel.textAlignment = .center
      fridayLabel.text = checkMarkString
      fridayLabel.sizeToFit()
      fridayLabel.textColor = .black
      
      
      // Adding a check box
      let checkboxRect = CGRect(x: fridayLabel.frame.maxX + 10.0, y: fridayLabel.frame.minY,
                                width: 18, height: 18)
      let checkbox = CheckboxButton(frame: checkboxRect, on: false)
      checkbox.borderStyle = 2
      checkbox.checkLineWidth = 2.0
      checkbox.cornerRadius = 3.0
      checkbox.checkColor = .white
      checkbox.containerFillsOnToggleOn = true
      checkbox.center = CGPoint(x: checkbox.center.x, y: fridayLabel.center.y)
      checkbox.addTarget(self, action: #selector(ViewController.alertCheckBoxDidChangeView(checkBox:)), for: .valueChanged)
      
      alertContentView.addSubview(fridayLabel)
      alertContentView.addSubview(checkbox)
      
    } else {
      debugPrint("alertContentView Body was not found")
    }
    let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { (action) in
      debugPrint("Confirm Button CLicked")
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
      debugPrint("cancelAction Button CLicked")
    }
    watingListAlert.addAction(confirmAction)
    watingListAlert.addAction(cancelAction)
    
    present(watingListAlert, animated: true) {
      
    }
  }
  
  func alertCheckBoxDidChangeView(checkBox: CheckboxButton){
    print("checkBox clicked = \(checkBox.on)")
  }


}

