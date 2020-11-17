//
//  ViewController.swift
//  Famous_dishes_of_countries
//
//  Created by Ayşenur Günal on 8.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizNameLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        copyDatabase()
        
    }
    func setupButtons(){
        startButton.layer.cornerRadius = 8
    }
   
    @IBAction func clickStartButton(_ sender: UIButton) {
        sender.pulsate()
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "quiz", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("quiz.sqlite")
        if fileManager.fileExists(atPath: placeToCopy.path){
            print("The database already exists.You don't need to copy.")
        }
        else{
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch  {
                print(error)
            }
        }
    }


}

