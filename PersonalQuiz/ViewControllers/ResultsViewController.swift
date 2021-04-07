//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    private func updateResult() {
        var animalsCount: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            animalsCount[animal] = (animalsCount[animal] ?? 0) + 1
        }
        
        let sortedAnimalsCout = animalsCount.sorted { $0.value > $1.value }
        guard let mostPopularAnimal = sortedAnimalsCout.first?.key else { return }
        
        updateResultsVC(with: mostPopularAnimal)
    }
    
    private func updateResultsVC(with animal: AnimalType) {
        resultAnswerLabel.text = "Вы – \(animal.rawValue)!"
        resultDefinitionLabel.text = "\(animal.definition)"
    }

}
