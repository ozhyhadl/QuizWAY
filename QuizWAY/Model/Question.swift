//
//  Question.swift
//  QuizWAY
//
//  Created by Oleksii ZHYHADLO on 2/29/20.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseQuestion
    var answer: [Answers]
}

extension Question {
    static func getQuestions() -> [Question]{
        return [
            Question(text: "Which food do you prefer ?",
                     type: .single,
                     answer: [
                        Answers(text: "Steak - 🥩", animal: .dog),
                        Answers(text: "Carrot - 🥕", animal: .rabbit),
                        Answers(text: "Apple - 🍏", animal: .panda),
                        Answers(text: "Rice - 🍚", animal: .pig)
                ]
            ),
            Question(text: "Your favorite action?",
                     type: .many,
                     answer: [
                        Answers(text: "Hug - 🤗", animal: .dog),
                        Answers(text: "Run - 🏃‍♂️", animal: .rabbit),
                        Answers(text: "Wrestling -🤼‍♂️", animal: .panda),
                        Answers(text: "Sleep - 🛌", animal: .pig)
                ]
            ),
            Question(text: "Do you like car rides?",
                     type: .diapason,
                     answer: [
                        Answers(text: "Hate - 😱", animal: .rabbit),
                        Answers(text: "Nervous", animal: .panda),
                        Answers(text: "Do not notice", animal: .pig),
                        Answers(text: "Delight - ☺️", animal: .dog)
                ]
            ),
            Question(text: "What sport do you like more?",
                     type: .single,
                     answer: [
                        Answers(text: "Football - ⚽️", animal: .dog),
                        Answers(text: "Basketball - 🏀", animal: .panda),
                        Answers(text: "Tennis - 🎾", animal: .rabbit),
                        Answers(text: "Volleyball - 🏐", animal: .pig)
                ]
            )
        ]
    }
}
