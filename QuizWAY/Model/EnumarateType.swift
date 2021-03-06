//
//  EnumarateType.swift
//  QuizWAY
//
//  Created by Oleksii ZHYHADLO on 2/29/20.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

enum ResponseQuestion  {
    case single
    case many
    case diapason
}

enum Animal: String {
    case dog = "🐶"
    case rabbit = "🐰"
    case panda = "🐼"
    case pig = "🐷"
    
    var definition: String {
        switch self {
        case .dog:
            return "You enjoy spending time with friends. You are a good friend and surround yourself with people who you like and are always ready to help."
        case .rabbit:
            return "You like everything soft. You are healthy and full of energy."
        case .pig:
            return "Everything suits you, self-confident and you don’t worry about what others say about you"
        case .panda:
            return "You are playful, love a healthy diet and are not in a hurry for life. Your strength is in confidence and beauty."
        }
    }
}
