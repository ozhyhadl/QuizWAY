//
//  ResultViewController.swift
//  QuizWAY
//
//  Created by Oleksii ZHYHADLO on 2/29/20.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    @IBOutlet var navigationBar: UINavigationItem!
    
    @IBOutlet var resultLable: UILabel!
    @IBOutlet var descriptionLable: UILabel!
    
    var response: [Answers]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.hidesBackButton = true
        calculateResult()
    }
    
    private func calculateResult() {
        var responseDictionary: [Animal: Int] = [:]
        let parseTypeAnimals = response.map { $0.animal }
        
        for animal in parseTypeAnimals {
            responseDictionary[animal] = (responseDictionary[animal] ?? 0) + 1
        }
        
        let sortedRespone = responseDictionary.sorted { $0.value > $1.value }
        guard let result = sortedRespone.first?.key else { return }
        
        resultLable.text = "You are - \(result.rawValue)"
        descriptionLable.text = result.definition
    }
}
