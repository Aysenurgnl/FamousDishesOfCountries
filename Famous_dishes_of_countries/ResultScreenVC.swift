//
//  ResultScreenVC.swift
//  Famous_dishes_of_countries
//
//  Created by Ayşenur Günal on 8.11.2020.
//

import UIKit

class ResultScreenVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var tryagainbutton: UIButton!
    
    var trueNumber:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tryagainbutton.layer.cornerRadius = 10

        navigationItem.hidesBackButton = true
        
        if let d = trueNumber{
            resultLabel.text = ("\(d) TRUE \(16-d) FALSE")
            percentLabel.text = "% \(d*100/16) SUCCESS"
        }
    }
   
    @IBAction func tryAgainButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
