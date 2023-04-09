//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultingDefinitionEmoji: UILabel!
    @IBOutlet var resultingDefinitionString: UILabel!
    
    var answersChosen: [Answer]!
    var animalsFromAnswers: [Animal] {
        var animals: [Animal] = []
        for answer in answersChosen {
            animals.append(answer.animal)
        }
        return animals
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        setResultsToLabels(forAnimal: findMostFrequentAnimal)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func findMostFrequentAnimal() -> Animal {
        var countsForEachAnimal = [Animal: Int]()
        var mostFrequentAnimal: Animal!
        var max = 0
    
        animalsFromAnswers.forEach { animal in
            if let count = countsForEachAnimal[animal] {
                countsForEachAnimal[animal] = count + 1
            } else {
                countsForEachAnimal[animal] = 1
            }
        }
        
        for (animal, count) in countsForEachAnimal {
            if count > max {
                max = count
                mostFrequentAnimal = animal
            }
        }
        return mostFrequentAnimal
    }
    
    private func setResultsToLabels(forAnimal: () -> Animal) {
        resultingDefinitionEmoji.text = "Вы - \(forAnimal().rawValue)"
        resultingDefinitionString.text = forAnimal().definition
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
