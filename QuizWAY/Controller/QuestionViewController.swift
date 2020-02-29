//
//  QuestionViewController.swift
//  QuizWAY
//
//  Created by Oleksii ZHYHADLO on 2/28/20.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var navigationBar: UINavigationItem!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var labelQuestion: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var manyStackView: UIStackView!
    @IBOutlet var manyAnswersText: [UILabel]!
    @IBOutlet var manySwitchAnswers: [UISwitch]!
    
    @IBOutlet var diapasonStackView: UIStackView!
    @IBOutlet var diapasonSlider: UISlider!
    @IBOutlet var diapasonLabel: [UILabel]!
    
    private var questionIndex = 0
    private let question = Question.getQuestions()
    private var respone: [Answers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UpdateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultViewController
        resultVC.respone = respone
    }
    
    //MARK: - IBAction
    @IBAction func singleAnswersButton(_ sender: UIButton) {
        guard let currentAnswerIndex = singleButtons.firstIndex(of: sender) else { return }
        let answers = question[questionIndex].answer
        guard currentAnswerIndex > answers.count - 1 else { return }
        respone.append(answers[currentAnswerIndex])
        
        nextQuestion()
    }
    
    @IBAction func manyNextButton() {
        let answers = question[questionIndex].answer
        for (switchAnswer, answer) in zip(manySwitchAnswers, answers) {
            if switchAnswer.isOn {
                respone.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func diapasonNextButton() {
        
        let answers = question[questionIndex].answer
        let currentAnswerIndex = Int(round(progressBar.progress * Float(answers.count - 1)))
        respone.append(answers[currentAnswerIndex])
        
        nextQuestion()
    }
    
    private func UpdateUI() {
        if question.isEmpty { return }
        let currentQuestion = question[questionIndex]
        let answers = currentQuestion.answer
        
        for stackView in [singleStackView, manyStackView, diapasonStackView] {
            stackView?.isHidden = true
        }
        navigationBar.title = "Question № \(questionIndex + 1) of \(question.count)"
        progressBar.progress = Float(questionIndex / (question.count - 1))
        labelQuestion.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single: singleQuestion(answers)
        case .many: manyQuestion(answers)
        case .diapason: diapasonQuestion(answers)
        }
    }
    
    //MARK: - Methods
    private func singleQuestion(_ answers: [Answers]) {
        singleStackView.isHidden = false
        
        for (answerButton, answer) in zip(singleButtons, answers) {
            answerButton.setTitle(answer.text, for: .normal)
        }
    }
    
    private func manyQuestion(_ answers: [Answers]) {
        manyStackView.isHidden = false
        
        for (answerLabel, answer) in zip(manyAnswersText, answers) {
            answerLabel.text = answer.text
        }
    }
    
    private func diapasonQuestion(_ answers: [Answers]) {
        diapasonStackView.isHidden = false
        
        diapasonLabel.first?.text = answers.first?.text
        diapasonLabel.last?.text = answers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < question.count {
            UpdateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
}
