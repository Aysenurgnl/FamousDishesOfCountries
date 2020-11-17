//
//  QuizScreenVC.swift
//  Famous_dishes_of_countries
//
//  Created by Ayşenur Günal on 8.11.2020.
//

import UIKit

class QuizScreenVC: UIViewController {

    @IBOutlet weak var trueLabel: UILabel!
    @IBOutlet weak var falseLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    var questions = [Dishes]()
    var wrongOptions = [Dishes]()
    
    var trueQuestion = Dishes()
    
    var questionCounter = 0
    var trueCounter = 0
    var falseCounter = 0
    
    var options = [Dishes]()
    var listOfMixingOptions = Set<Dishes>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonA.layer.cornerRadius = 10
        buttonB.layer.cornerRadius = 10
        buttonC.layer.cornerRadius = 10
        buttonD.layer.cornerRadius = 10
        foodImage.layer.cornerRadius = 10
        
        questions = Dishesdao().random16Bring()
        
        
        for s in questions{
            print(s.food_name!)
        }
        uploadQuestion()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let togoVC = segue.destination as! ResultScreenVC
        togoVC.trueNumber = trueCounter
    }
    func uploadQuestion(){
        
        trueLabel.text = "True : \(trueCounter)"
        falseLabel.text = "False : \(falseCounter)"
        
        trueQuestion = questions[questionCounter]
        foodImage.image = UIImage(named: trueQuestion.food_image!)
        wrongOptions = Dishesdao().random3wrongoptions(food_id: trueQuestion.food_id!)
        foodNameLabel.text = trueQuestion.food_name
        
        
        
        listOfMixingOptions.removeAll()
        listOfMixingOptions.insert(trueQuestion)
        listOfMixingOptions.insert(wrongOptions[0])
        listOfMixingOptions.insert(wrongOptions[1])
        listOfMixingOptions.insert(wrongOptions[2])
        
        options.removeAll()
        for k in listOfMixingOptions{
            options.append(k)
        }
        buttonA.setTitle(options[0].country_name, for: .normal)
        buttonB.setTitle(options[1].country_name, for: .normal)
        buttonC.setTitle(options[2].country_name, for: .normal)
        buttonD.setTitle(options[3].country_name, for: .normal)
        
        
        
        
    }
    func trueControl(button:UIButton){
        let buttonText = button.titleLabel?.text
        let trueAnswer = trueQuestion.country_name
        
        print("Button text : \(buttonText!)")
        print("True Answer : \(trueAnswer!)")
        
        if trueAnswer == buttonText{
            trueCounter += 1
            
        }
        else{
            falseCounter += 1
        }
        trueLabel.text = "True : \(trueCounter)"
        falseLabel.text = "False : \(falseCounter)"
    }
    func questionCounterControl(){
        questionCounter += 1
        if questionCounter != 16{
            uploadQuestion()
        }
        else{
            performSegue(withIdentifier: "toResultPage", sender: nil)
        }
    }
 
    
    @IBAction func clickButtonA(_ sender: Any) {
        trueControl(button: buttonA)
        questionCounterControl()
    }
    
    
    @IBAction func clickButtonB(_ sender: Any) {
        trueControl(button: buttonB)
        questionCounterControl()
    }
    
    
    @IBAction func clickButtonC(_ sender: Any) {
        trueControl(button: buttonC)
        questionCounterControl()
    }
    @IBAction func clickButtonD(_ sender: Any) {
        trueControl(button: buttonD)
        questionCounterControl()
    }
}
