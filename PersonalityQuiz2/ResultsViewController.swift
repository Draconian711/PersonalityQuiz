//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Kevin Bjornberg on 10/8/24.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatedPersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatedPersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [Richness: Int]()) { (counts, answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            } else {
                counts[answer.type] = 1
            }
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue) !"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    

    
    var responses: [Answer]
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
