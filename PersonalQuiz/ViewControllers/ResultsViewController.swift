//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
   
    var resultAnswers: [Answer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showResult(with: resultAnswers)
        
    }
    
    func showResult(with answers: [Answer])  {
        var frequencyOfAnimals: [AnimalType :Int] = [:]
        let animals = answers.map {$0.type}
        
        for animal in animals {
            if let _ = frequencyOfAnimals[animal] {
                frequencyOfAnimals[animal]! += 1
            }
            else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals =  frequencyOfAnimals.sorted(by: {$0.1 > $1.1})
       
//        guard let emojiRV = sortedFrequencyOfAnimals.first!.key.rawValue as? String else {return}
    
        emojiLabel.text = "Вы " + String(sortedFrequencyOfAnimals.first!.key.rawValue)
        descriptionLabel.text = sortedFrequencyOfAnimals.first!.key.definition
    
    }
   
}
