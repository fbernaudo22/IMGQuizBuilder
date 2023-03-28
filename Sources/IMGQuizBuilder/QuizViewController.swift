//
//  ViewController.swift
//  imageQuizBuilder
//
//  Created by Francesco Bernaudo on 28/03/23.
//

import UIKit

open class QuizViewController: UIViewController {
    
    /// quizElements contains the names of the elements you want to insert in the quiz.
    /// The names must be the same of the images ones that you will upload in the assets.
    open var quizElements: [String] = []
    open var correctAnswer: Int = 0
    open var quizTitle: String?
    
    
    
    /// These are the variables related with the possible answers.
    open var answer1: UIButton?
    open var answer2: UIButton?
    open var answer3: UIButton?
    
    /// This variable is related with the image displayed during the quiz.
    open var quizImage: UIImageView?
    
    
    public init?(quizElements: [String], quizTitle: String?, answer1: UIButton, answer2: UIButton, answer3: UIButton, quizImage: UIImageView){
        self.quizElements = quizElements
        self.quizTitle = quizTitle
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.quizImage = quizImage
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
        
    
    
    
 
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// This function sets the questions of the quiz. it shuffles the array with the quiz elements, and then
    /// associates three of them with the answers buttons. Then it choices from them a correct answer randomly and display the associated image.
    open func askQuestion(action: UIAlertAction! = nil){
        quizElements.shuffle()
        correctAnswer = Int.random(in: 0...2)
        setAnswer(answer1: answer1!, answer2: answer2!, answer3: answer3!)
        quizImage?.image = UIImage(named: quizElements[correctAnswer])
        setButtonTags()
        
        
    }
    
    /// This function set the button tags to the correct values.
    open func setButtonTags(){
        answer1?.tag = 0
        answer2?.tag = 1
        answer3?.tag = 2
    }
    
    open func setAnswer(answer1: UIButton, answer2: UIButton, answer3: UIButton){
        answer1.setTitle(quizElements[0], for: .normal)
        answer2.setTitle(quizElements[1], for: .normal)
        answer3.setTitle(quizElements[2], for: .normal)
    }
    
    /// This function just checks if the answer is correct or not and displays the result throught an alert.
    /// - Parameter sender: sender is the button that the user taps.
    open func answerSelection(sender: UIButton) {
        var alertTitle: String
        
        if sender.tag == correctAnswer {
            //Here you can modify the message displayed in case of correct answer. I'll keep it simple with a "Correct"
            alertTitle = "Correct"
            
        } else {
            //Here you can modify the message displayed in case of wrong answer. I'll keep it simple with a "Not Correct"
            alertTitle = "Not Correct"
        }
        
       let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Next", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }
    
}

