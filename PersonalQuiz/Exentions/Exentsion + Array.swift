//
//  Exentsion + Array.swift
//  PersonalQuiz
//
//  Created by Andrey Matviets on 09.04.2023.
//

import Foundation

extension Array where Element: Hashable {
    func mostFrequent() -> Element? {
        let counts = reduce(into: [:]) { $0[$1, default: 0] += 1 }
        guard let (value, _) = counts.max(by: { $0.1 < $1.1 }) else { return nil }
        return value
    }
}
