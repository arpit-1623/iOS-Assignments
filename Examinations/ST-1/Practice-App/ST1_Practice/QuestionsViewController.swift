//
//  QuestionsViewController.swift
//  ST1_Practice
//
//  Created by Arpit Garg on 02/08/25.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleQuestionStack: UIStackView!
    @IBOutlet weak var multiQuestionStack: UIStackView!
    @IBOutlet weak var rangedQuestionStack: UIStackView!
    
    @IBOutlet weak var singleQuestion1: UIButton!
    @IBOutlet weak var singleQuestion2: UIButton!
    @IBOutlet weak var singleQuestion3: UIButton!
    @IBOutlet weak var singleQuestion4: UIButton!
    
    @IBOutlet weak var multiQuestionLabel1: UILabel!
    @IBOutlet weak var multiQuestionLabel2: UILabel!
    @IBOutlet weak var multiQuestionLabel3: UILabel!
    @IBOutlet weak var multiQuestionLabel4: UILabel!
    
    @IBOutlet weak var multiQuestion1: UISwitch!
    @IBOutlet weak var multiQuestion2: UISwitch!
    @IBOutlet weak var multiQuestion3: UISwitch!
    @IBOutlet weak var multiQuestion4: UISwitch!
    
    @IBOutlet weak var rangedQuestionSlider: UISlider!
    @IBOutlet weak var rangedQuestionLabel1: UILabel!
    @IBOutlet weak var rangedQuestionLabel2: UILabel!
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionIndex: Int = 0;
    var currentAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        singleQuestionStack.isHidden = true
        multiQuestionStack.isHidden = true
        rangedQuestionStack.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = "Question #\(questionIndex + 1)"
        questionTextLabel.text = currentQuestion.content
        progressBar.setProgress(currentProgress, animated: false)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(currentQuestion.answers)
        case .multiple:
            updateMultipleStack(currentQuestion.answers)
        case .ranged:
            updateRangedStack(currentQuestion.answers)
        
        }
    }
    
    func updateSingleStack(_ answers: [Answer]) {
        singleQuestionStack.isHidden = false
        
        singleQuestion1.setTitle(answers[0].content, for: .normal)
        singleQuestion2.setTitle(answers[1].content, for: .normal)
        singleQuestion3.setTitle(answers[2].content, for: .normal)
        singleQuestion4.setTitle(answers[3].content, for: .normal)
    }
    
    func updateMultipleStack(_ answers: [Answer]) {
        multiQuestionStack.isHidden = false
        
        multiQuestionLabel1.text = answers[0].content
        multiQuestionLabel2.text = answers[1].content
        multiQuestionLabel3.text = answers[2].content
        multiQuestionLabel4.text = answers[3].content
        
        multiQuestion1.isOn = false
        multiQuestion2.isOn = false
        multiQuestion3.isOn = false
        multiQuestion4.isOn = false
    }
    
    func updateRangedStack(_ answers: [Answer]) {
        rangedQuestionStack.isHidden = false
        
        rangedQuestionLabel1.text = answers[0].content
        rangedQuestionLabel2.text = answers[answers.count - 1].content
        
        rangedQuestionSlider.setValue(0.5, animated: false)
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBAction func singleAnswerTapped(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        switch sender {
        case singleQuestion1:
            currentAnswers.append(answers[0])
        case singleQuestion2:
            currentAnswers.append(answers[1])
        case singleQuestion3:
            currentAnswers.append(answers[2])
        case singleQuestion4:
            currentAnswers.append(answers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerTapped(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        if multiQuestion1.isOn {
            currentAnswers.append(answers[0])
        }
        
        if multiQuestion2.isOn {
            currentAnswers.append(answers[1])
        }
        
        if multiQuestion3.isOn {
            currentAnswers.append(answers[2])
        }
        
        if multiQuestion4.isOn {
            currentAnswers.append(answers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerTapped(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        let sliderValue = rangedQuestionSlider.value
        
        switch sliderValue {
        case 0.0...0.25:
            currentAnswers.append(answers[0])
        case 0.26...0.50:
            currentAnswers.append(answers[1])
        case 0.51...0.75:
            currentAnswers.append(answers[2])
        case 0.76...1.0:
            currentAnswers.append(answers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Results" {
            print(currentAnswers)
            let destination = segue.destination as! ResultsViewController
            destination.answersChosen = currentAnswers
        }
    }
    
}
