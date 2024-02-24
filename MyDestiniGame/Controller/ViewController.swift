//
//  ViewController.swift
//  MyDestiniGame
//
//  Created by Павел Широкий on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {

    var storyBrain = StoryBrain()
    
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var choice1Button: UIButton!
    @IBOutlet var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
        
    }

    @IBAction func choiceButtonPress(_ sender: UIButton) {
    
        let answer = sender.currentTitle!
        
        if storyBrain.checkAnswer(answer) {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateTitle), userInfo: nil, repeats: false)
        
    }
    
    @objc private func updateTitle() {
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Text(), for: .normal)
        
    }

}

